From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 13 Apr 2014 11:41:41 +0300
Subject: [Buildroot] [PATCH] ne10: bump version to 1.0.0
In-Reply-To: <877g6zbl0v.fsf@dell.be.48ers.dk>
References: <99baf8d8d8d05b5f2de390deef6546acab0199dd.1396965306.git.baruch@tkos.co.il>
 <877g6zbl0v.fsf@dell.be.48ers.dk>
Message-ID: <20140413084140.GC4149@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Apr 08, 2014 at 10:53:36PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Switch to github helper while at it.
>  > Fixes:
>  > http://autobuild.buildroot.net/results/a2c/a2ca3fe245e410a738f4b10631a1414696a0edea/
> 
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  > ---
> 
> Hmm, something doesn't work here:
> 
> Building C object modules/CMakeFiles/NE10_test.dir/math/NE10_detmat.neon.s.o
> [ 95%] Building C object modules/CMakeFiles/NE10_test.dir/math/NE10_transmat.neon.s.o
> Linking C executable NE10_test_static
> [ 95%] [ 96%] Building C object modules/CMakeFiles/NE10_test.dir/math/NE10_identitymat.neon.s.o
> Building C object modules/CMakeFiles/NE10_test.dir/dsp/NE10_cfft.neon.s.o
> /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.1/../../../../arm-none-linux-gnueabi/bin/ld: cannot find crt1.o: No such file or directory
> /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.1/../../../../arm-none-linux-gnueabi/bin/ld: cannot find crti.o: No such file or directory
> /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.1/../../../../arm-none-linux-gnueabi/bin/ld: cannot find -lm
> /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.1/../../../../arm-none-linux-gnueabi/bin/ld: cannot find -lgcc_s
> /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.1/../../../../arm-none-linux-gnueabi/bin/ld: cannot find -lc
> /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.1/../../../../arm-none-linux-gnueabi/bin/ld: cannot find -lgcc_s
> /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.1/../../../../arm-none-linux-gnueabi/bin/ld: cannot find crtn.o: No such file or directory
> collect2: error: ld returned 1 exit status
> make[3]: *** [samples/NE10_test_static] Error 1
> make[3]: Leaving directory `/home/peko/source/buildroot/output/build/ne10-v1.0.0'
> make[2]: *** [samples/CMakeFiles/NE10_test_static.dir/all] Error 2
> make[2]: *** Waiting for unfinished jobs....
> [ 96%] Linking C shared library libNE10.so
> Building C object modules/CMakeFiles/NE10_test.dir/dsp/NE10_fft_float32.neon.s.o
> [ 96%] Building C object modules/CMakeFiles/NE10_test.dir/dsp/NE10_fft_int32.neon.s.o
> [ 97%] [ 97%] Building C object modules/CMakeFiles/NE10_test.dir/dsp/NE10_fir.neon.s.o
> Building C object modules/CMakeFiles/NE10_test.dir/dsp/NE10_fft_int16.neon.s.o
> /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.1/../../../../arm-none-linux-gnueabi/bin/ld: cannot find crti.o: No such file or directory
> /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.1/../../../../arm-none-linux-gnueabi/bin/ld: cannot find -lm
> /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.1/../../../../arm-none-linux-gnueabi/bin/ld: cannot find -lgcc_s
> /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.1/../../../../arm-none-linux-gnueabi/bin/ld: cannot find -lc
> /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.1/../../../../arm-none-linux-gnueabi/bin/ld: cannot find -lgcc_s
> /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.8.1/../../../../arm-none-linux-gnueabi/bin/ld: cannot find crtn.o: No such file or directory
> collect2: error: ld returned 1 exit status
> make[3]: *** [modules/libNE10.so.10] Error 1
> 
> With a clean cortex A8 build (default codesourcery external toolchain).
> 
> Any ideas?

Thanks for testing. This is caused by the -mthumb that is hard coded in 
CMakeLists.txt, which is incompatible with the default -marm. I added a 
dependency on BR2_ARM_INSTRUCTIONS_THUMB || BR2_ARM_INSTRUCTIONS_THUMB2 to fix 
this.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
