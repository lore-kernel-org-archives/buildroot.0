From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Jan 2013 00:36:23 +0100
Subject: [Buildroot] [PATCH] Fix PYC-only installation for Python3
In-Reply-To: <1359313382-2257-1-git-send-email-daniel@sigpwr.com>
References: <1359313382-2257-1-git-send-email-daniel@sigpwr.com>
Message-ID: <5105B9F7.506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/01/13 20:03, Daniel Nelson wrote:
> All,
>
> This is my first buildroot/open source submission. I'd appreciate some feedback.
>
> Python3 changes the behavior of .pyc caching, breaking the PYC-only option in buildroot. The details are in http://www.python.org/dev/peps/pep-3147
>
> I've added a configure flag to Python3, and corresponding logic in buildroot.
>
> Thoughts?
>
> Thanks,
>
> Daniel Nelson

  This message will end up in the git log, but it's not appropriate for 
that. Please create a proper commit message, and make sure it is 
line-wrapped at 80 columns. If you want to give additional comments  that 
should not go into the git log (like the 'this is my first open source 
submission'), add them below the ---.

  Also, we require you to add a Signed-off-by line for yourself. This is 
a short way for you to assert that you are entitled to contribute the 
patch under buildroot's GPL license. See
http://elinux.org/Developer_Certificate_Of_Origin
for more details.


  More minor comments below - but they're just optional, so:
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (untested)

(If you repost this patch, with or without the proposed modifications, 
you can add my Acked-by line below your Signed-off-by line.)


> ---
>   ...ython3-3.3-012-support-pre-pep3147-stdlib.patch | 121 +++++++++++++++++++++
>   package/python3/python3.mk                         |   4 +
>   2 files changed, 125 insertions(+)
>   create mode 100644 package/python3/python3-3.3-012-support-pre-pep3147-stdlib.patch
>
> diff --git a/package/python3/python3-3.3-012-support-pre-pep3147-stdlib.patch b/package/python3/python3-3.3-012-support-pre-pep3147-stdlib.patch
> new file mode 100644
> index 0000000..fadd5e1
> --- /dev/null
> +++ b/package/python3/python3-3.3-012-support-pre-pep3147-stdlib.patch
> @@ -0,0 +1,121 @@
> +--- python3-3.3.0/configure.ac	2013-01-26 19:12:56.446601796 -0800
> ++++ python3-3.3.0-new/configure.ac	2013-01-26 19:11:31.632687123 -0800
> +@@ -1827,6 +1828,28 @@
> +     LIBTOOL_CRUFT=$LIBTOOL_CRUFT' -compatibility_version $(VERSION) -current_version $(VERSION)';;
> + esac
> +
> ++STDLIB_CACHE_FLAGS=
> ++STDLIB_CACHE_TYPE=pep3147
> ++AC_MSG_CHECKING(for --with-stdlib-cache)
> ++AC_ARG_WITH(stdlib-cache,

  Since there are only two options, an AC_ARG_ENABLE seems more 
appropriate. That also makes the implementation slightly smaller because 
you don't need the STDLIB_CACHE_TYPE, just:

AC_ARG_ENABLE(old-stdlib-cache,
     AS_HELP_STRING(...),
     [
     if [ "$enableval" = "yes" ]; then
        STDLIB_CACHE_FLAGS="-b"
     else
        STDLIB_CACHE_FLAGS=""
     fi
     ],
     [STDLIB_CACHE_FLAGS=""])

> ++    AS_HELP_STRING([--with-stdlib-cache=type], [select type of stdlib cache ("pep3147", or "old")]),
> ++[
> ++	AC_MSG_RESULT($withval)
> ++    STDLIB_CACHE_TYPE=$withval
> ++],
> ++[
> ++ 	AC_MSG_RESULT(${STDLIB_CACHE_TYPE})
> ++])
> ++case $STDLIB_CACHE_TYPE in
> ++    pep3147)
> ++        STDLIB_CACHE_FLAGS=""
> ++        ;;
> ++    old)
> ++        STDLIB_CACHE_FLAGS="-b"
> ++        ;;
> ++esac
> ++AC_SUBST(STDLIB_CACHE_FLAGS)
> ++
> + AC_MSG_CHECKING(for --enable-framework)
> + if test "$enable_framework"
> + then
> +--- python3-3.3.0/configure	2012-09-29 01:00:50.000000000 -0700
> ++++ python3-3.3.0-new/configure	2013-01-26 19:11:38.562839350 -0800

  Since we run autoreconf, it's not necessary to patch the configure 
script - it will anyway be overwritten.



  Regards,
  Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
