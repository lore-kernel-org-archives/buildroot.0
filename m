From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 13:57:09 +0100
Subject: [Buildroot] [v3 0/2] openssl: parallel build
In-Reply-To: <1442405185-4103-1-git-send-email-ryanbarnett3@gmail.com>
References: <1442405185-4103-1-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <20151118135709.125f4afd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan,

On Wed, 16 Sep 2015 07:06:23 -0500, Ryan Barnett wrote:
> I have adopted Thomas P's patches that we submitted but in May in order
> enable parallel build of openssl. I have updated the patches to use the
> latest patches available from gentoo and have tested builds only on i386,
> ARM, and MIPS.
> 
> Original Patches:
> 
> http://patchwork.ozlabs.org/patch/473086/
> http://patchwork.ozlabs.org/patch/473087/
> 
> Ryan Barnett (2):
>   openssl: use git formatted patches
>   openssl: enable parallel build and installation

I have the feeling that the parallel build patches for OpenSSL are not
working properly. Look at the recent build failures we've got for the
openssl and host-openssl builds:

  http://autobuild.buildroot.org/?reason=openssl-1.0.2d
  http://autobuild.buildroot.org/?reason=host-openssl-1.0.2d

They are pretty much all due to a similar error:

  ln: failed to create symbolic link 'libssl.so': File exists
  ln: creating symbolic link `libcrypto.so': File exists

I could spot only one that is different:

In file included from apps.h:117:0,
                 from req.c:74:
../include/openssl/bio.h:521:34: error: expected ';' before 'BIO_ctrl'
 # define BIO_set_fp(b,fp,c)      BIO_ctrl(b,BIO_C_SET_FILE_PTR,c,(char *)fp)

Do you have some ideas? Does Gentoo has some more patches? Should we
revert back to non-parallel build for OpenSSL ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
