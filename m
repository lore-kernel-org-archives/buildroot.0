From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 17 Jan 2013 14:27:46 +0100
Subject: [Buildroot] Target rebuilding
In-Reply-To: <4486164.oLnzyGq5cK@sagittae>
References: <4486164.oLnzyGq5cK@sagittae>
Message-ID: <50F7FC52.7040608@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?r?me!

Am 17.01.2013 12:04, schrieb J?r?me Pouiller:
> Hello all,
>
> It is handy to do tests directly in target/. But after some time, it is 
> necessary to make a new fresh target/ directory.
This topic comes up from time to time. Once upon a time I sent a patch
to introduce a "make target-clean" (
http://lists.busybox.net/pipermail/buildroot/2012-October/060484.html )
, but it does not seem that this feature can be implemented in a
reliable way, especially when libraries are removed from .config.

So for now I fear we have to stick to "make clean && make" if we want to
clean up our file system.
>  The current procedure to do 
> this is:
>
> * remove build/.root (or remove target/ if you want to throw all your work)
What's the use in removing the stamp file and keeping the target
directory? I think the whole proccedure is meant to chean up the target
file system, isn't it?

Regards

Stephan
> * remove build/*/.stamp_target_installed
> * depending of you toolchain:
>   # remove stamps/ext-toolchain-installed (external)
>   # remove stamps/ct-ng-toolchain-installed (ctng)
>   # remove target/lib/libc.so.0 (buildroot)
> * launch make
>
> I think this process lacks of consistency. Idealy, this process should be:
>   rm -r target (depending if want to throw all your work)
>   rm build/*/.stamp_target_installed
>   make
>
> I suggest following changes:
>
>  1. Move build/.root to stamps/. Since it is hidden, many user forget this 
> file exist.
>
>  2. All stamps files are in subdirectories of build/. I suggest to move 
> stamps/ to build/stamps/
>
>  3. Buildroot toolchain should create a stamp files to be uniform with other 
> toolchains. In add, target/lib/libc.so.0 never exists when PREFER_STATIC_LIB 
> is enable.
>
>  4. To be consistent stamps/*-toolchain-installed may be renamed 
> stamps/.stamp_target_installed or stamps/.stamp_toolchain_target_installed or 
> toolchain/.stamp_target_installed. We may add a README file to explain what is 
> purpose of this apparently empty directory.
>
>   5. stamps/ext-toolchain-installed currently copy libc in staging/ and in 
> target/. It may be splited in two rules: stamps/ext-toolchain-target-installed 
> and stamps/ext-toolchain-staging-installed.
>
>
> What do you think about it?
>
>
> Regards,
>


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
