From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 02 Jul 2014 08:18:08 +0200
Subject: [Buildroot] [PATCH 1/1] libssh2: fix library search path issues
 when zlib support enabled
In-Reply-To: <53B1590D.9040606@geral.com>
References: <1403878684-11934-1-git-send-email-acoffignal@geral.com>
 <20140629163016.41256df2@free-electrons.com>
 <f8abef86a41446e6ac7848dfa49e9842@VMSMBX02.gpi.pri>
 <20140630140216.49d73fa4@free-electrons.com> <53B1590D.9040606@geral.com>
Message-ID: <53B3A420.2090900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/06/14 14:33, Alexandre COFFIGNAL wrote:
> Thomas,
> 
> here contents of output/build/libssh2-1.4.3/config.log  :


 The log doesn't give much interesting information.

 However, I see in the configure script at line 14539:

    eval additional_libdir=\"$libdir\"

and a bit lower, at line 14616:

            dir="$additional_libdir"
                                    if test -n "$acl_shlibext"; then
              if test -f "$dir/$libname$shrext"; then
                found_dir="$dir"
                found_so="$dir/$libname$shrext"

 Since libdir is /usr/lib, it will indeed find libz there.

 I guess, Thomas, that on your machine, libz.so is in /usr/lib64 so configure
doesn't find it there.


 But basically that means this configure script is truly broken, not just for
libz but for any use of AC_LIB_HAVE_LINKFLAGS...


 Perhaps AUTORECONF will help?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
