From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 Nov 2013 12:42:30 +0100
Subject: [Buildroot] [PATCH] audiofile: needs dynamic library
In-Reply-To: <1384244924-31625-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Tue, 12 Nov 2013 08:28:44 +0000")
References: <1384244924-31625-1-git-send-email-spdawson@gmail.com>
Message-ID: <87ob5p4zix.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

> From: Simon Dawson <spdawson@gmail.com>
> Fixes build failures such as the following.

>   http://autobuild.buildroot.net/results/c00/c002711ef82fb29f1765df251bd0006caeccc508/

> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  package/audiofile/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

> diff --git a/package/audiofile/Config.in b/package/audiofile/Config.in
> index 4aa8d69..9752648 100644
> --- a/package/audiofile/Config.in
> +++ b/package/audiofile/Config.in
> @@ -1,11 +1,12 @@
>  config BR2_PACKAGE_AUDIOFILE
>  	bool "audiofile"
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_PREFER_STATIC_LIB
>  	help
>  	  The Audio File Library handles reading and writing audio files
>  	  in many common formats.
 
>  	  http://www.68k.org/~michael/audiofile/
 
> -comment "audiofile needs a toolchain w/ C++"
> -	depends on !BR2_INSTALL_LIBSTDCPP
> +comment "audiofile needs a toolchain w/ C++, dynamic library"
> +	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PREFER_STATIC_LIB

Thanks, but you forgot the reverse dependencies:

git grep -l 'select BR2_PACKAGE_AUDIOFILE'
package/mpd/Config.in

Looking at the build log, the only reason why it fails is that libtool
is acting up. It wants to link with libstdc++.so instead of libstdc++.a.

A quick test shows that you can fix it by passing -static instead of
--static in LDFLAGS, but that effectively reverts 0a4bd19f4a136930c:

http://git.buildroot.net/buildroot/commit/?id=0a4bd19f4a136930c

Does anybody know what the right solution is?

-- 
Bye, Peter Korsgaard
