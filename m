From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Sep 2018 19:56:51 +0200
Subject: [Buildroot] [PATCH 1/2] package/pkg-generic.mk: increase
 precision of timestamps
In-Reply-To: <20180921133117.9300-2-thomas.petazzoni@bootlin.com>
References: <20180921133117.9300-1-thomas.petazzoni@bootlin.com>
 <20180921133117.9300-2-thomas.petazzoni@bootlin.com>
Message-ID: <20180922175651.GA6450@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-09-21 15:31 +0200, Thomas Petazzoni spake thusly:
> Currently, the timestamps that we keep in build-time.log use a
> second-level precision. However, as we are going to introduce a new
> type of graph to draw the time line of a build, this precision is
> going to be insufficient, as a number of steps are so short that they
> are not even one second long, and generally the rounding to the second
> gives a not so great looking graph.
> 
> Therefore, we add to the timestamps the nanoseconds using the %N date
> specifier. A milli-second precision would have been sufficient, but %N
> is all what date(1) provides at the sub-second level.

%N has existed since at least 2002, when it was actually documented in
commit 17e6a0e4bb. So, we can conclude that %N is universally availble.

Besides, %N can provide millisecond precision, by specifying the
precision, like so:

    date +%3N

But I still think plain %N is OK as well, and I don't know since when
that has been possible, so:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Since this is changing the format of the build-time.log file, this
> commit adjusts the support/scripts/graph-build-time script
> accordingly, to account for the floating point numbers that we have as
> timestamps.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-generic.mk           | 2 +-
>  support/scripts/graph-build-time | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 91b61c6de0..daf24594de 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -50,7 +50,7 @@ endef
>  # Time steps
>  define step_time
>  	printf "%s:%-5.5s:%-20.20s: %s\n"           \
> -	       "$$(date +%s)" "$(1)" "$(2)" "$(3)"  \
> +	       "$$(date +%s.%N)" "$(1)" "$(2)" "$(3)"  \
>  	       >>"$(BUILD_DIR)/build-time.log"
>  endef
>  GLOBAL_INSTRUMENTATION_HOOKS += step_time
> diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
> index 415d431f23..892e08bf07 100755
> --- a/support/scripts/graph-build-time
> +++ b/support/scripts/graph-build-time
> @@ -260,7 +260,7 @@ def read_data(input_file):
>          return None
>  
>      for row in reader:
> -        time = int(row[0].strip())
> +        time = float(row[0].strip())
>          state = row[1].strip()
>          step = row[2].strip()
>          pkg = row[3].strip()
> -- 
> 2.14.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
