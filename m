From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Mar 2017 10:31:58 -0300
Subject: [Buildroot] [PATCH v2] libepoxy: OpenGL EGL and OpenGL ES
 dependencies are mandatory
In-Reply-To: <20170323142827.2dc1af5e@free-electrons.com>
References: <20170322115643.48653-1-Vincent.Riera@imgtec.com>
 <20170322225648.5a32abeb@free-electrons.com>
 <ea393b5769dccf6047c895588cab7298@zacarias.com.ar>
 <20170323142827.2dc1af5e@free-electrons.com>
Message-ID: <a18b94fc97da118b9e5232569b5e09ae@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-03-23 10:28, Thomas Petazzoni wrote:

> Hello,
> 
> On Thu, 23 Mar 2017 10:00:59 -0300, Gustavo Zacarias wrote:
>> On 2017-03-22 18:56, Thomas Petazzoni wrote:
>> 
>> >> Also, libepoxy use dlsym to load a GLES2 library when EGL support is
>> >> enabled, see src/dispatch_common.c:
>> >>
>> >> So, OpenGL ES dependency is also mandatory.
>> >>
>> >> Fixes:
>> >>
>> >> http://autobuild.buildroot.net/results/3eca5ba26a521f6cc5a611309ba066472af7769c
>> >>
>> >> http://autobuild.buildroot.net/results/cf9ec7da196d70548ae1413e4a3730314f6434d6
>> >>
>> >> http://autobuild.buildroot.net/results/069b80101afc4719db6d6d41cf5fc923be21ddc0
>> >>
>> >> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> >> Reviewed-by: Romain Naour <romain.naour@gmail.com>
>> >> Tested-by: Romain Naour <romain.naour@gmail.com>
>> >
>> > I would really like to hear about this patch from Gustavo. Gustavo,
>> > could you review/comment?
>> 
>> Hi all.
>> According to my tests this isn't a hard requirement - libepoxy builds
>> and works fine with just EGL, in fact a PoC is pretty easy, just clone
>> http://repo.or.cz/buildroot-gz.git/shortlog/refs/heads/desktop, make
>> pc_x86_64_bios_wayland_defconfig, make menuconfig, disable GLES, build
>> and the resulting image which is wayland-weston-midori (hence gtk3, 
>> plus
>> some other gtk3 apps) works just fine.
>> And by looking at the source i don't see where in dispatch_common.c 
>> the
>> lack of GLES errors out hard.
> 
> Then what is your proposal to fix the build issues that this patch is
> trying to fix? The build log clearly points to missing EGL as being the
> issue:
> 
> checking for EGL... no
> configure: error: Package requirements (egl) were not met:
> 
> Package egl was not found in the pkg-config search path.
> Perhaps you should add the directory containing `egl.pc'
> to the PKG_CONFIG_PATH environment variable
> Package 'egl', required by 'world', not found
> 
> Consider adjusting the PKG_CONFIG_PATH environment variable if you
> installed software in a non-standard prefix.
> 
> Alternatively, you may set the environment variables EGL_CFLAGS
> and EGL_LIBS to avoid the need to call pkg-config.
> See the pkg-config man page for more details.
> make[1]: ***
> [/home/buildroot/autobuild/run/instance-2/output/build/libepoxy-1.4.1/.stamp_configured]
> Error 1
> make: *** [_all] Error 2
> make: Leaving directory 
> `/home/buildroot/autobuild/run/instance-2/buildroot'
> 
> Best regards,
> 
> Thomas

Hi Thomas.
The patch is mixing two different "issues":
1) It "fixes" that EGL support, without GLX, requires GLES, which isn't 
true.
2) It fixes the autobuilder failures that GLX requires EGL - which 
wasn't the case before (1.3.x versions). I need to consult upstream 
about this, my guess is that it's probably wrong since EGL isn't a hard 
requirement for GLX - GLX existed long before EGL did.

Regards.
