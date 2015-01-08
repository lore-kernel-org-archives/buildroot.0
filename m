From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 11:03:44 +0100
Subject: [Buildroot] [PATCH try 2] wine: New package
In-Reply-To: <54AC4E25.4050601@dawncrow.de>
References: <54AC4E25.4050601@dawncrow.de>
Message-ID: <20150108110344.29267904@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Tue, 06 Jan 2015 22:05:41 +0100, Andr? Hentschel wrote:
> Adds new package: wine
> 
>   Wine is a compatibility layer capable of running Windows applications on Linux.
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>

I did some actual testing of this, and here are the issues:

 * host-flex should be in HOST_WINE_DEPENDENCIES. Otherwise, I get
   "configure: error: no suitable flex found" at configure time of
   host-wine. You didn't see the error because you have the flex
   utility installed in your system.

 * host-bison should be in HOST_WINE_DEPENDENCIES, for the same reason.

 * With those issues fixed, the build still doesn't work, I get a
   "winebuild: cannot find suitable name lister" message. More log
   below:

../../../host-wine-1.6.2/tools/winegcc/winegcc -b i586-buildroot-linux-gnu  -B../../../host-wine-1.6.2/tools/winebuild --sysroot=../.. -fasynchronous-unwind-tables -shared ./advapi32.spec advapi.o cred.o crypt.o crypt_arc4.o crypt_des.o crypt_lmhash.o crypt_md4.o crypt_md5.o crypt_sha.o eventlog.o lsa.o registry.o security.o service.o   svcctl_c.o    version.res    -o advapi32.dll.so -lrpcrt4  -Wb,-drpcrt4 ../../libs/port/libwine_port.a
../../../host-wine-1.6.2/tools/winegcc/winegcc -b i586-buildroot-linux-gnu  -B../../../host-wine-1.6.2/tools/winebuild --sysroot=../.. -fasynchronous-unwind-tables -shared ./advapi32.spec advapi.o cred.o crypt.o crypt_arc4.o crypt_des.o crypt_lmhash.o crypt_md4.o crypt_md5.o crypt_sha.o eventlog.o lsa.o registry.o security.o service.o   svcctl_c.o    version.res    -o advapi32.dll.fake -lrpcrt4  -Wb,-drpcrt4 ../../libs/port/libwine_port.a
winebuild: cannot find suitable name lister
winegcc: ../../../host-wine-1.6.2/tools/winebuild/winebuild failed
make[3]: *** [advapi32.dll.so] Error 2
make[2]: *** [dlls/advapi32] Error 2
../../../host-wine-1.6.2/tools/winegcc/winegcc -b i586-buildroot-linux-gnu  -B../../../host-wine-1.6.2/tools/winebuild --sysroot=../.. -fasynchronous-unwind-tables -shared ./actxprxy.spec usrmarshal.o   actxprxy_activscp_p.o actxprxy_comcat_p.o actxprxy_docobj_p.o actxprxy_hlink_p.o actxprxy_htiface_p.o actxprxy_htiframe_p.o actxprxy_objsafe_p.o actxprxy_ocmm_p.o actxprxy_servprov_p.o actxprxy_shldisp_p.o actxprxy_shobjidl_p.o actxprxy_urlhist_p.o  actxprxy_activscp_r.res actxprxy_comcat_r.res actxprxy_docobj_r.res actxprxy_hlink_r.res actxprxy_htiface_r.res actxprxy_htiframe_r.res actxprxy_objsafe_r.res actxprxy_ocmm_r.res actxprxy_servprov_r.res actxprxy_shldisp_r.res actxprxy_shobjidl_r.res actxprxy_urlhist_r.res    dlldata.o  -o actxprxy.dll.so  -luuid -loleaut32 -lole32 -lrpcrt4  ../../libs/port/libwine_port.a
../../../host-wine-1.6.2/tools/winegcc/winegcc -b i586-buildroot-linux-gnu  -B../../../host-wine-1.6.2/tools/winebuild --sysroot=../.. -fasynchronous-unwind-tables -shared ./actxprxy.spec usrmarshal.o   actxprxy_activscp_p.o actxprxy_comcat_p.o actxprxy_docobj_p.o actxprxy_hlink_p.o actxprxy_htiface_p.o actxprxy_htiframe_p.o actxprxy_objsafe_p.o actxprxy_ocmm_p.o actxprxy_servprov_p.o actxprxy_shldisp_p.o actxprxy_shobjidl_p.o actxprxy_urlhist_p.o  actxprxy_activscp_r.res actxprxy_comcat_r.res actxprxy_docobj_r.res actxprxy_hlink_r.res actxprxy_htiface_r.res actxprxy_htiframe_r.res actxprxy_objsafe_r.res actxprxy_ocmm_r.res actxprxy_servprov_r.res actxprxy_shldisp_r.res actxprxy_shobjidl_r.res actxprxy_urlhist_r.res    dlldata.o  -o actxprxy.dll.fake  -luuid -loleaut32 -lole32 -lrpcrt4  ../../libs/port/libwine_port.a
winebuild: cannot find suitable name lister
winegcc: ../../../host-wine-1.6.2/tools/winebuild/winebuild failed
make[3]: *** [actxprxy.dll.so] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [dlls/actxprxy] Error 2
make[1]: *** [/home/test/outputs/wine/build/wine-1.6.2/.stamp_built] Error 2
make: *** [_all] Error 2

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
