From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Feb 2017 21:41:41 +0100
Subject: [Buildroot] [PATCH v5 01/19] reproducible: fix DATE/TIME macros
	in toolchain-wrapper
In-Reply-To: <1482241596-31688-2-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Tue, 20 Dec 2016 14:46:18 +0100")
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-2-git-send-email-jezz@sysmic.org>
Message-ID: <87k291rawq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > The use __DATE__ and __TIME__ are one of most common sources of

The use of.

 > non-reproducible binaries. In order to fix that, gcc begin to support
 > SOURCE_DATE_EPOCH variable. This patch take advantage of toolchain-wrapper
 > to provide support of SOURCE_DATE_EPOCH to older gcc versions.

 > Function get_source_date_epoch() come directly from gcc git.

 > This work was sponsored by `BA Robotic Systems'.

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
 > ---

 > Notes:
 >     v3:
 >       - Handle $SOURCE_DATE_EPOCH at runtime (Thomas)
 >     v2:
 >       - Overload __TIME__ and __DATE__ instead of patching gcc (Thomas)

 >  toolchain/toolchain-wrapper.c | 74 ++++++++++++++++++++++++++++++++++++++++++-
 >  1 file changed, 73 insertions(+), 1 deletion(-)

 > diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
 > index d59629b..6150574 100644
 > --- a/toolchain/toolchain-wrapper.c
 > +++ b/toolchain/toolchain-wrapper.c
 > @@ -22,12 +22,17 @@
 >  #include <unistd.h>
 >  #include <stdlib.h>
 >  #include <errno.h>
 > +#include <time.h>
 
 >  #ifdef BR_CCACHE
 >  static char ccache_path[PATH_MAX];
 >  #endif
 >  static char path[PATH_MAX];
 >  static char sysroot[PATH_MAX];
 > +// strlen("-D__TIME__=\"HH:MM:SS\"") + 1 = 22
 > +static char source_time[22];
 > +// strlen("-D__DATE__=\"MMM DD YYYY\"") + 1 = 25
 > +static char source_date[25];

It is nicer to simply use sizeof on that string, E.G.:

static char source_time[sizeof("-D__TIME__=\"HH:MM:SS\"")];

Then the comment can be dropped and the comment never gets out of sync
with the size.


 >  /**
 >   * GCC errors out with certain combinations of arguments (examples are
 > @@ -39,8 +44,11 @@ static char sysroot[PATH_MAX];
 >   * 	-mfloat-abi=
 >   * 	-march=
 >   * 	-mcpu=
 > + * 	-D__TIME__=
 > + * 	-D__DATE__=
 > + * 	-Wno-builtin-macro-redefined
 >   */
 > -#define EXCLUSIVE_ARGS	3
 > +#define EXCLUSIVE_ARGS	6
 
 >  static char *predef_args[] = {
 >  #ifdef BR_CCACHE
 > @@ -139,6 +147,47 @@ static void check_unsafe_path(const char *arg,
 >  	}
 >  }
 
 > +/* Read SOURCE_DATE_EPOCH from environment to have a deterministic
 > + * timestamp to replace embedded current dates to get reproducible
 > + * results.  Returns -1 if SOURCE_DATE_EPOCH is not defined.
 > + */
 > +time_t get_source_date_epoch()

This should be static.


> +{
 > +	char *source_date_epoch;
 > +	long long epoch;
 > +	char *endptr;
 > +
 > +	source_date_epoch = getenv("SOURCE_DATE_EPOCH");
 > +	if (!source_date_epoch)
 > +		return (time_t) -1;
 > +
 > +	errno = 0;
 > +	epoch = strtoll (source_date_epoch, &endptr, 10);

NIT: No space between strtoll and '('.

> +	if ((errno == ERANGE && (epoch == LLONG_MAX || epoch == LLONG_MIN))
 > +			|| (errno != 0 && epoch == 0)) {
 > +		fprintf(stderr, "environment variable $SOURCE_DATE_EPOCH: "
 > +				"strtoll: %s\n", strerror(errno));
 > +		exit(2);
 > +	}
 > +	if (endptr == source_date_epoch) {
 > +		fprintf(stderr, "environment variable $SOURCE_DATE_EPOCH: "
 > +				"no digits were found: %s\n", endptr);
 > +		exit(2);
 > +	}
 > +	if (*endptr != '\0') {
 > +		fprintf(stderr, "environment variable $SOURCE_DATE_EPOCH: "
 > +				"trailing garbage: %s\n", endptr);
 > +		exit(2);
 > +	}
 > +	if (epoch < 0) {
 > +		fprintf(stderr, "environment variable $SOURCE_DATE_EPOCH: "
 > +				"value must be nonnegative: %lld \n", epoch);
 > +		exit(2);
 > +	}

I'm not sure this detailed error handling is really needed, but OK.

Committed, thanks.

-- 
Bye, Peter Korsgaard
