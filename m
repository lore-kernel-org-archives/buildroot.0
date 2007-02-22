From: James Newell <jnewell@wgate.com>
Date: Thu, 22 Feb 2007 15:58:52 -0500
Subject: [Buildroot] undefined __aeabi_read_tp
Message-ID: <1172177933.22966.13.camel@ndragon.eng.wgate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was building the ubuntu upstart package, and ran into an undefined
__aeabi_read_tp call.  

The gcc defines:
-mtp=name
           Specify the access model for the thread local storage pointer.  The
           valid models are soft, which generates calls to "__aeabi_read_tp",
           cp15, which fetches the thread pointer from "cp15" directly (sup-
           ported in the arm6k architecture), and auto, which uses the best
           available method for the selected processor.  The default setting
           is auto.

The __aeabi_read_tp is not defined in the uclibc libs:
[jnewell at ndragon staging_dir]$ nm $(find . -type f -name "*.a")|grep
eabi_read_tp
         U __aeabi_read_tp
         U __aeabi_read_tp
         U __aeabi_read_tp
         U __aeabi_read_tp
         U __aeabi_read_tp
         U __aeabi_read_tp
         U __aeabi_read_tp
         U __aeabi_read_tp
         U __aeabi_read_tp
         U __aeabi_read_tp
         U __aeabi_read_tp
         U __aeabi_read_tp

Does anyone know who should be defining this call? 

Thanks,
Jim

Some of my config:
[jnewell at ndragon buildroot]$ grep -e ^BR2_GCC -e ABI -e THREAD .config
# BR2_ARM_OABI is not set
BR2_ARM_EABI=y
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
# BR2_PTHREADS_OLD is not set
BR2_PTHREADS_NATIVE=y
# BR2_PTHREAD_DEBUG is not set
BR2_GCC_VERSION_4_2=y
BR2_GCC_IS_SNAP=y
BR2_GCC_SNAP_DATE="20070214"
BR2_GCC_VERSION="4.2"
BR2_GCC_SHARED_LIBGCC=y
BR2_SOFT_FLOAT=y

 
