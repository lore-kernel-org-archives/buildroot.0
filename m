From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Mar 2016 23:19:50 +0100
Subject: [Buildroot] Bug during Kodi compile with host gcc <4.7,
 question regarding autobuilders
In-Reply-To: <934hrcx7vo.ln2@ID-313208.user.individual.net>
References: <934hrcx7vo.ln2@ID-313208.user.individual.net>
Message-ID: <56E5E786.1090906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/13/16 22:53, Bernd Kuhls wrote:
> Hi,
>
> before sending a patch which fixes a problem with host gcc < 4.7 I would
> like to ask whether this patch is needed at all. Are there autobuilders
> where the host version of gcc is < 4.7?

  Well, RHEL6 has gcc 4.4, and ideally we'd like to support RHEL5 as well (many 
companies are still based on it).

  But we have a simple solution now: kodi depends on BR2_HOST_GCC_AT_LEAST_4_7. 
Cfr. nodejs for instance, which faces the same problem.

  Regards,
  Arnout

>
> While testing Kodi compilation using buildroot master this error occurs:
>
> cc1plus: error: unrecognized command line option '-std=c++11'
> make[4]: *** [md5.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> cc1plus: error: unrecognized command line option '-std=c++11'cc1plus:
> error: unrecognized command line option '-std=c++11'
>
> make[4]: *** [DecoderManager.o] Error 1
> make[4]: *** [XBTFWriter.o] Error 1
> cc1plus: error: unrecognized command line option '-std=c++11'
> make[4]: *** [TexturePacker.o] Error 1
> cc1plus: error: unrecognized command line option '-std=c++11'
> make[4]: *** [decoder/PNGDecoder.o] Error 1
> make[3]: *** [all] Error 2
> make[2]: *** [native/TexturePacker] Error 2
> make[1]: *** [/home/fli4l/buildroot/output/build/kodi-16.0-
> Jarvis/.stamp_configured] Error 2
>
> while the host version of TexturePacker is compiled during autoreconf on
> Ubuntu 12.04.5 with "gcc-Version 4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5)".
>
> To fix the problem change "-std=c++11" to "-std=c++0x" in tools/depends/
> native/TexturePacker/src/Makefile.am.
>
> To reproduce the bug use this defconfig:
>
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
> BR2_PACKAGE_XORG7=y
>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
