From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:43:46 +0100
Subject: [Buildroot] [PATCH] ncftp: fix host/target confusion
In-Reply-To: <CANxTyt6tGknGoHc2swaeqh-h6L740Ny79UwgH4AqQH2SfjQYnQ@mail.gmail.com>
References: <1488322477-25447-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170301214800.1a6c3405@free-electrons.com>
 <877f47hccp.fsf@dell.be.48ers.dk>
 <CANxTyt6tGknGoHc2swaeqh-h6L740Ny79UwgH4AqQH2SfjQYnQ@mail.gmail.com>
Message-ID: <20170302214346.1157dda6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Mar 2017 11:07:55 -0800, Danomi Manchego wrote:

> Are you able to download this tarball with the hash indicated in
> ncftp.hash?  I keep getting an error:
> 
> ERROR: ncftp-3.2.6-src.tar.xz has wrong sha256 hash:
> ERROR: expected:
> 7abd3e8f848f0efb4bb6a4bc5da58a59524d4378fc8d70a52adb0fe1fd00b89d
> ERROR: got     :
> 5f200687c05d0807690d9fb770327b226f02dd86155b49e750853fce4e31098d
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack

It seems like the tarball has been re-generated and republished by
upstream.

Indeed, a diff between the two shows:

-3.2.6, 2016-12-04
+3.2.6, 2016-09-23

(where the - lines are the tarball from the upstream site, which is
newer, and the + lines are the tarball from sources.buildroot.net). And
interestingly, the web page at
http://www.ncftp.com/ncftp/doc/changelog.html pretends that the 3.2.6
version has been released on 2016-11-27...

And the diffstat is actually not that small:

 Strn/DStrInternal.h       |    4 
 Strn/Strn.h               |    2 
 autoconf_local/acconfig.h |    8 
 autoconf_local/aclocal.m4 |  116 ---
 config.h.in               |    8 
 configure                 | 1701 ++++++++++++++++++++--------------------------
 configure.in              |    9 
 doc/CHANGELOG.txt         |    2 
 libncftp/c_opennologin.c  |    4 
 libncftp/ftp.c            |   31 
 libncftp/ftw.c            |    2 
 libncftp/io_getmem.c      |    2 
 libncftp/io_list.c        |    6 
 libncftp/io_sendfile.c    |    4 
 libncftp/io_util.c        |    4 
 libncftp/ncftp.h          |    2 
 libncftp/open.c           |    4 
 libncftp/rftw.c           |    2 
 libncftp/rglobr.c         |    2 
 libncftp/u_decodehost.c   |    2 
 libncftp/u_decodeurl.c    |    2 
 libncftp/u_getpass.c      |    2 
 libncftp/u_misc.c         |    2 
 libncftp/u_pathcat.c      |    4 
 libncftp/u_scram.c        |    2 
 libncftp/wincfg.h         |    1 
 ncftp/cmds.c              |   38 -
 ncftp/gl_getline.c        |   26 
 ncftp/ls.c                |    9 
 ncftp/ls.h                |    9 
 ncftp/progress.c          |    9 
 ncftp/readln.c            |    4 
 ncftp/shell.h             |   10 
 ncftp/spoolutil.c         |    8 
 ncftp/version.c           |    2 
 sh/mksrctar.sh            |    1 
 sh_util/gpshare.c         |   12 
 sh_util/ncftpbatch.c      |  110 --
 sh_util/ncftpget.c        |    6 
 sh_util/ncftpls.c         |    5 
 sh_util/ncftpput.c        |   14 
 sio/DNSUtil.c             |    4 
 sio/Makefile.in           |   16 
 sio/SBind.c               |   35 
 sio/SConnect.c            |    9 
 sio/SNew.c                |  115 ---
 sio/SRead.c               |    6 
 sio/StrAddr.c             |    6 
 sio/config.h.in           |   24 
 sio/configure.in          |    8 
 sio/sio.h                 |   18 
 sio/wincfg.h              |    1 
 vis/bmed.c                |   13 
 vis/wgets.c               |   12 
 vis/wgets.h               |    7 
 vis/wutil.c               |    6 
 vis/wutil.h               |    6 
 win/bmed/bmed.vcproj      |    4 

I'm not sure what to do in this case? Blindly take the new upstream
version? Complain to upstream?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
