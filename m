From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Oct 2017 22:38:52 +0200
Subject: [Buildroot] [PATCH] toolchain/wrapper: fake __DATE_ and
 __TIME__ for older gcc
In-Reply-To: <20171021203102.14520-1-arnout@mind.be>
References: <20171021203102.14520-1-arnout@mind.be>
Message-ID: <20171021203852.GG7022@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-10-21 22:31 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Starting with version 7, gcc automatically recognises and enforces the
> environment variable SOURCE_DATE_EPOCH, and fakes __DATE__ and __TIME__
> accordingly, to produce reproducible builds (at least in regards to date
> and time).
> 
> However, older gcc versions do not offer this feature.
> 
> So, we use our toolchain wrapper to force-feed __DATE__ and __TIME__ as
> macros, which will take precedence over those that gcc may compute
> itself. We compute them according to the specs:
>     https://reproducible-builds.org/specs/source-date-epoch/
>     https://gcc.gnu.org/onlinedocs/cpp/Standard-Predefined-Macros.html
> 
> Since we define macros otherwise internal to gcc, we have to tell it not
> to warn about that. The -Wno-builtin-macro-redefined flag was introduced
> in gcc-4.4.0. Therefore, we make BR2_REPRODUCIBLE depend on GCC >= 4.4.
> 
> gcc-7 will ignore SOURCE_DATE_EPOCH when __DATE__ and __TIME__ are
> user-defined. Anyway, this is of no consequence: whether __DATE__ and
> __TIME__ or SOURCE_DATE_EPOCH takes precedence, it would yield the
> exact same end result since we use the same logic to compute it. Note
> that we didn't copy the code for it from gcc so using the same logic
> doesn't imply that we're inheriting GPL-3.0.

Thnaks for re-spinning this! :-)

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: J?r?me Pouiller <jezz@sysmic.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> [Arnout: rewrite commit message]
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Config.in                     |  2 ++
>  toolchain/toolchain-wrapper.c | 75 +++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 75 insertions(+), 2 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index 9bdb0b857a..8920b727ce 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -712,6 +712,8 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
>  
>  config BR2_REPRODUCIBLE
>  	bool "Make the build reproducible (experimental)"
> +	# SOURCE_DATE_EPOCH support in toolchain-wrapper requires GCC 4.4
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
>  	help
>  	  This option will remove all sources of non-reproducibility
>  	  from the build process. For a given Buildroot configuration,
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index dd77c11131..2928ea42d0 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -22,12 +22,19 @@
>  #include <unistd.h>
>  #include <stdlib.h>
>  #include <errno.h>
> +#include <time.h>
> +#include <stdbool.h>
>  
>  #ifdef BR_CCACHE
>  static char ccache_path[PATH_MAX];
>  #endif
>  static char path[PATH_MAX];
>  static char sysroot[PATH_MAX];
> +/* As would be defined by gcc:
> + *   https://gcc.gnu.org/onlinedocs/cpp/Standard-Predefined-Macros.html
> + * sizeof() on string literals includes the terminating \0. */
> +static char _time_[sizeof("-D__TIME__=\"HH:MM:SS\"")];
> +static char _date_[sizeof("-D__DATE__=\"MMM DD YYYY\"")];
>  
>  /**
>   * GCC errors out with certain combinations of arguments (examples are
> @@ -35,12 +42,15 @@ static char sysroot[PATH_MAX];
>   * that we only pass the predefined one to the real compiler if the inverse
>   * option isn't in the argument list.
>   * This specifies the worst case number of extra arguments we might pass
> - * Currently, we have:
> + * Currently, we may have:
>   * 	-mfloat-abi=
>   * 	-march=
>   * 	-mcpu=
> + * 	-D__TIME__=
> + * 	-D__DATE__=
> + * 	-Wno-builtin-macro-redefined
>   */
> -#define EXCLUSIVE_ARGS	3
> +#define EXCLUSIVE_ARGS	6
>  
>  static char *predef_args[] = {
>  #ifdef BR_CCACHE
> @@ -160,6 +170,60 @@ static void check_unsafe_path(const char *arg,
>  	}
>  }
>  
> +/* Returns false if SOURCE_DATE_EPOCH was not defined in the environment.
> + *
> + * Returns true if SOURCE_DATE_EPOCH is in the environment and represent
> + * a valid timestamp, in which case the timestamp is formatted into the
> + * global variables _date_ and _time_.
> + *
> + * Aborts if SOURCE_DATE_EPOCH was set in the environment but did not
> + * contain a valid timestamp.
> + *
> + * Valid values are defined in the spec:
> + *     https://reproducible-builds.org/specs/source-date-epoch/
> + * but we further restrict them to be positive or null.
> + */
> +bool parse_source_date_epoch_from_env(void)
> +{
> +	char *epoch_env, *endptr;
> +	time_t epoch;
> +	struct tm epoch_tm;
> +
> +	if ((epoch_env = getenv("SOURCE_DATE_EPOCH")) == NULL)
> +		return false;
> +	errno = 0;
> +	epoch = (time_t) strtoll(epoch_env, &endptr, 10);
> +	/* We just need to test if it is incorrect, but we do not
> +	 * care why it is incorrect.
> +	 */
> +	if ((errno != 0) || !*epoch_env || *endptr || (epoch < 0)) {
> +		fprintf(stderr, "%s: invalid SOURCE_DATE_EPOCH='%s'\n",
> +			program_invocation_short_name,
> +			epoch_env);
> +		exit(1);
> +	}
> +	tzset(); /* For localtime_r(), below. */
> +	if (localtime_r(&epoch, &epoch_tm) == NULL) {
> +		fprintf(stderr, "%s: cannot parse SOURCE_DATE_EPOCH=%s\n",
> +				program_invocation_short_name,
> +				getenv("SOURCE_DATE_EPOCH"));
> +		exit(1);
> +	}
> +	if (!strftime(_time_, sizeof(_time_), "-D__TIME__=\"%T\"", &epoch_tm)) {
> +		fprintf(stderr, "%s: cannot set time from SOURCE_DATE_EPOCH=%s\n",
> +				program_invocation_short_name,
> +				getenv("SOURCE_DATE_EPOCH"));
> +		exit(1);
> +	}
> +	if (!strftime(_date_, sizeof(_date_), "-D__DATE__=\"%b %e %Y\"", &epoch_tm)) {
> +		fprintf(stderr, "%s: cannot set date from SOURCE_DATE_EPOCH=%s\n",
> +				program_invocation_short_name,
> +				getenv("SOURCE_DATE_EPOCH"));
> +		exit(1);
> +	}
> +	return true;
> +}
> +
>  int main(int argc, char **argv)
>  {
>  	char **args, **cur, **exec_args;
> @@ -289,6 +353,13 @@ int main(int argc, char **argv)
>  	}
>  #endif /* ARCH || CPU */
>  
> +	if (parse_source_date_epoch_from_env()) {
> +		*cur++ = _time_;
> +		*cur++ = _date_;
> +		/* This has existed since gcc-4.4.0. */
> +		*cur++ = "-Wno-builtin-macro-redefined";
> +	}
> +
>  	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
>  	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
>  		paranoid = 1;
> -- 
> 2.15.0.rc1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
