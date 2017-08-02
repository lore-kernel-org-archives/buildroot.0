From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 02 Aug 2017 10:04:28 +0200
Subject: [Buildroot] [PATCH 1/2] lua: fix pkg-config file
In-Reply-To: <20170801190840.457a6f6d@windsurf.home>
References: <20170731211800.5888-1-joerg.krause@embedded.rocks>
 <20170801190840.457a6f6d@windsurf.home>
Message-ID: <1501661068.1978.11.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2017-08-01 at 19:08 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 31 Jul 2017 23:17:59 +0200, J?rg Krause wrote:
> > When Lua is linked with additional libraries, these libraries
> > should go
> > into the pkg-config file as well.
> > 
> > Otherwise, linking swupdate with the lua library fails:
> > 
> > ```
> > /home/buildroot/output/host/arm-buildroot-linux-
> > gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to
> > `dlopen'
> > /home/buildroot/output/host/arm-buildroot-linux-
> > gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to
> > `dlclose'
> > /home/buildroot/output/host/arm-buildroot-linux-
> > gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to
> > `dlerror'
> > /home/buildroot/output/host/arm-buildroot-linux-
> > gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to `dlsym'
> > ```
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> Is this fixing an autobuilder issue ? I guess it should fix the ones
> you mention in PATCH 2/2, but obviously only for the supported Lua
> versions.

It is an autobuilder issue indeed, but it was not detected the date I
wrote the patch. The autobuilder issues concerning swupdate until that
date where Lua 5.1/LuaJIT related. I noticed the issue using the Linaro
 Toolchain for armhf.

There is now a report of an autobuilder from yesterday:
http://autobuild.buildroot.net/results/1c3/1c349cc5904868e4def292b9fbfa
164828e46156/

Not all toolchains are producing the issue (only glibc ones?):

                armv5-ctng-linux-gnueabi [ 1/47]: FAILED
              armv7-ctng-linux-gnueabihf [ 2/47]: FAILED
                        br-aarch64-glibc [ 3/47]: FAILED
                           br-arcle-hs38 [ 4/47]: OK
                            br-arm-basic [ 5/47]: OK
                  br-arm-cortex-a9-glibc [ 6/47]: FAILED
                   br-arm-cortex-a9-musl [ 7/47]: OK
                             br-arm-full [ 9/47]: OK
                      br-arm-full-static [11/47]: OK
                   br-i386-pentium4-full [13/47]: OK
                br-i386-pentium-mmx-musl [14/47]: OK
                      br-m68k-68040-full [16/47]: OK
                    br-microblazeel-full [17/47]: OK
                 br-mips32r6-el-hf-glibc [18/47]: FAILED
                      br-mips64-n64-full [19/47]: OK
                 br-mips64r6-el-hf-glibc [20/47]: FAILED

J?rg
