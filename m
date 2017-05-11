From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 10:02:07 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-10
In-Reply-To: <20170511062842.8AC6121D45@mail.free-electrons.com>
References: <20170511062842.8AC6121D45@mail.free-electrons.com>
Message-ID: <20170511100207.148e4c7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 May 2017 08:28:42 +0200 (CEST), Thomas Petazzoni wrote:

>       successes : 253
>        failures : 24 

Still pretty good (less than 10% failures), but we can do better!

On the 24 failures:

 -  2 have fixes already committed (ltp-testsuite)
 -  6 have fixes submitted (efibootmgr and radvd)
 -  3 can easily be fixed (modem-manager)
 - 13 need more investigation :-)

>          arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/87c3ff2427331eb9ab31c9eb685fe80954a0a98f |     
>          arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/368656c338f6ea732f564291d660bc1721b34af7 |     

I just submitted https://patchwork.ozlabs.org/patch/760964/ to fix
those two issues.

>          arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/c909e8c397ab972b6aa4d370572cad4fae284d00 |     
>          arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/d681917034730d374092881e90875d3149e31774 |     

Still the ARC toolchain issues.

>          arm |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/cb94f4859c7cf60c76dd978ed941883ff732ba11 |     
>        sparc |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/e68191d1ae42100119ab2f872eeff8ba4b1b7c8d |     

These have been fixed by:

  https://git.buildroot.org/buildroot/commit/?id=bb98e425f8edc27c3d39d49cfec94a514b03b988
  https://git.buildroot.org/buildroot/commit/?id=0c514410ed1554ce7a86f87c061479fe979385b2
  https://git.buildroot.org/buildroot/commit/?id=583f59702bdd2baa040a37eef061530973269880

>         m68k |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/775c81b5d0064cb196bbb367368dd76eb46ecf93 | ORPH

../src/utils/ffmpeg-priv.h:111:17: error: conflicting types for 'avcodec_alloc_context3'

Peter (Korsgaard), you originally added this package, could you have a look ?

>          arm |            modem-manager-1.6.4 | NOK | http://autobuild.buildroot.net/results/fe9b6b1b1399a4e8aafc6a326c81ec97c2480025 |     
>         i686 |            modem-manager-1.6.4 | NOK | http://autobuild.buildroot.net/results/40eef797b4d8d53fc6e10f2048316d63549caf6d |     
>          arm |            modem-manager-1.6.4 | NOK | http://autobuild.buildroot.net/results/e3e3b61fb1162648f45c73b2a07509e0ab95b3d4 |     

As Yegor pointed out, same problem as libqmi, it can easily be fixed by
providing an implementation of canonicalize_file_name() inside
modem-manager.

>        sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/2fce6f9607019c25e5dfff49dacddb199ef885cf |     
>        sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/437c6e3e49742a29a33b1cc6b450fdf9b0561dc5 |     

Needs investigation:

  ERROR: architecture for "/usr/lib/libopenblas_sparcp-r0.2.19.dev.so" is "Sparc v8+", should be "Sparc"

>        sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3111e01f89f6038964c1aed1f2504cbc63ce8d62 | ORPH

./.libs/libprotobuf.so: undefined reference to `__atomic_fetch_add_4'
./.libs/libprotobuf.so: undefined reference to `__atomic_compare_exchange_4'

Needs to link with libatomic.

>         i686 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/c6a60e9f6395b8dbd457be57642dfaa1c8d86104 |     
>         i686 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/1729c660f2d43504b684be0b1a156b92652d3dba |     

https://svn.boost.org/trac/boost/ticket/9240 seems related.

>         i586 |           qt5declarative-5.8.0 | NOK | http://autobuild.buildroot.net/results/9e3f14e342be2a7f6204173a30cb1f01570c971a |     

Weird undefined references.

Peter (Seiderer), could you have a look ?

>          arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/739406bb8073d1861933872a47802954d9767634 | ORPH

Tries to build a shared library in a BR2_STATIC_LIBS=y configuration.
Can probably be fixed by tweaking QWT_CONFIG to remove QwtDll.

>          arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/a1a7e938ac4260802bf0e24f64829d559295ef39 |     
>         m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/2c08a56053afef4b475790571ba0f4d9c506ec29 |     

Static linking issues...

>       xtensa |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/469d3e2f0c0739787b52e8497cf22a1571d8a001 | ORPH
> microblazeel |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/24b2e2e515987cca86d2905f8cbcea820755d526 | ORPH
>       xtensa |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/fa0c3393c2bcdbc2287c3b8a96cd16e2845a22a3 | ORPH
>       xtensa |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/d3796b9dbdaf93b6bfa66633d111729e0745c2c0 | ORPH

I submitted a patch to fix this, see
https://patchwork.ozlabs.org/patch/760962/.

>       x86_64 |               strongswan-5.4.0 | NOK | http://autobuild.buildroot.net/results/6120add5ad6e7f5d575fc2a2442cd7fe5302eb46 |     

af_alg_ops.c:110:22: error: conflicting types for 'crypt'

Anyone to have a look ?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
