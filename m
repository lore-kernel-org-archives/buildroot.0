From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Dec 2019 18:52:40 +0000
Subject: [Buildroot] [Bug 12426] NodeJS slow startup performance (~30s)
In-Reply-To: <bug-12426-163@https.bugs.busybox.net/>
References: <bug-12426-163@https.bugs.busybox.net/>
Message-ID: <bug-12426-163-khUZIgL5jq@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12426

--- Comment #3 from D. Price <daniel.price+buildrootbz@gmail.com> ---

Hi Thomas!  Long time since I've helped out with Buildroot but happy to try to
be of assistance.

Eric indicated to me that this largely a startup issue, and not one of node's
actual performance.

One of node's performance tricks is to take a snapshot of its V8 interpreter
"world" and store that as a snapshot.  This is accomplished using the
mksnapshot command during the build.  This has been tricky for them to get
right when cross-compiling.

Eric tried removing the --without-snapshot flag from the build but then the
build failed trying to run mksnapshot (I think because it was running the
target command, not the host version).

Eric Said:
> Maybe there's another problem in my config, but having removed that flag from nodejs.mk, the build failed.
> I reverted my changes to .config, ran make clean and removed the contents from dl/ and ~/.buildroot-ccache before building.
> 
>  touch 5e8f1fa6be42bf232d2ec48bae2a475b98d6f2f6.intermediate
>  LD_LIBRARY_PATH=/home/vagrant/buildroot/output/build/nodejs-12.13.0/out/Release/lib.host:/home/vagrant/buildroot/output/build/nodejs-12.13.0/out/Release/lib.target:$LD_LIBRARY_PATH; export LD_LIBRARY_PATH; cd ../tools/v8_gypfiles; mkdir -p /home/vagrant/buildroot/output/build/nodejs-12.13.0/out/Release/obj.target/v8_snapshot/geni; "/home/vagrant/buildroot/output/build/nodejs-12.13.0/out/Release/mksnapshot" --turbo_instruction_scheduling "--target_os=linux" "--target_arch=arm" --startup_src "/home/vagrant/buildroot/output/build/nodejs-12.13.0/out/Release/obj.target/v8_snapshot/geni/snapshot.cc" --embedded_variant Default --embedded_src "/home/vagrant/buildroot/output/build/nodejs-12.13.0/out/Release/obj.target/v8_snapshot/geni/embedded.S" --no-native-code-counters
> /lib/ld-uClibc.so.0: No such file or directory
> tools/v8_gypfiles/v8_snapshot.target.mk:16: recipe for target 
> '5e8f1fa6be42bf232d2ec48bae2a475b98d6f2f6.intermediate' failed
> make[3]: *** [5e8f1fa6be42bf232d2ec48bae2a475b98d6f2f6.intermediate] Error 255
> ...
> Makefile:101: recipe for target 'node' failed
> make[2]: *** [node] Error 2

I said:

> I haven't worked with this, but to me this looks like the mksnapshot command
> (which has been cross-compiled for you) is now failing to run
> (/home/vagrant/buildroot/output/build/nodejs-12.13.0/out/Release/mksnapshot).
> 
> I found some github bug reports related to this but nothing which really is
> a definitive guide.  I also found this, which might help: 
> https://chrislea.com/2018/08/20/cross-compiling-node-js-for-arm-on-ubuntu/ .
> Several of the sources I found talk about setting CC_host and CXX_host, which
> to the best of my recollection the buildroot recipe does not do.  IIRC
> buildroot uses HOSTCC and HOSTCXX instead
> (see https://buildroot.org/downloads/manual/manual.html, 8.6).  So maybe that
> is important?  I don't know.  Somewhere I also found a thing which said
> that you have to be careful exactly how you set CC_host and CXX_host, to make
> sure -m32 was passed.  I dunno.  
> Buried in https://github.com/nodejs/build/issues/266 is the statement
> 
> "I believe I have this working now and will be able to re-enable snapshots
> when nodejs/node#4117 lands. V8 can handle cross compiling of snapshots if
> the {CC,CXX}_host variables are defined, by compiling the mksnapshot
> executable with the host compiler."
> 
> Which seems useful.

So that is my recommendation:
- Double check that it's strictly a startup issue
- Try to enable the snapshot feature

-- 
You are receiving this mail because:
You are on the CC list for the bug.
