From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Jun 2015 23:05:26 +0200
Subject: [Buildroot] B3+external kernel: not quite sure how to make
 these pieces fit ...
In-Reply-To: <066601d0aeb0$e445c840$acd158c0$@novadsp.com>
References: <066601d0aeb0$e445c840$acd158c0$@novadsp.com>
Message-ID: <558B1B96.8070701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/24/15 21:06, g4 at novadsp.com wrote:
> Want to automate building kernel and filesystem for Beaglebones.
> 
>  
> 
> The kernel itself is the mainline 4.x with a set of patches applied from Robert
> Nelson?s (RCN) GIT repo.
> 
>  
> 
> Problem is that there is no mechanism for file system construction/ packaging.
> Obviously Buildroot to the rescue here.
> 
>  
> 
> I thought I?d start by trying to get BR to use the existing external toolchain ?
> specifying ?toolchain path? as
> ?~/rcn/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux?
> 
>  
> 
> But this fails with ?External toolchain uses the unsuported OABI?. There is an
> old reference to this here:
> http://git.buildroot.net/buildroot/commit/?id=b2e88073dbf05faa47475bf96d5ccf8a45906a3c

 Looks like your external toolchain is not installed correctly. Can you run
~/rcn/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin/arm-linux-gnueabihf-gcc
-v

 Or to be safe, just select the Linaro 2014.09 toolchain as to be downloaded and
installed.


> I don?t see any conflict with the target settings. Is there a solution or is
> this a more fundamental/complex issue?
> 
>  
> 
> This obviously begs the question of how the externally built kernel gets into
> the BR mix but I?ll leave that for next time.

 You'll have to run 'make -C <linux_dir> INSTALL_MOD_PATH=$1 modules_install'
from a post-build script. Or else, install the modules in some staging directory
and copy them to the target directory in the post-build script.

 Or alternatively, just build it in buildroot with BR2_LINUX_KERNEL_CUSTOM_LOCAL=y.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
