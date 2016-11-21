From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 22 Nov 2016 00:38:07 +0100
Subject: [Buildroot] Analysis of autobuild failures 18-19/11
In-Reply-To: <20161121230850.00bbc1cf@free-electrons.com>
References: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
 <20161121230850.00bbc1cf@free-electrons.com>
Message-ID: <bfc05511-fb21-e223-ced5-6108cd702fea@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-11-16 23:08, Thomas Petazzoni wrote:
> Hello,
> 
> First of all, thanks a lot for doing this work!
> 
> On Sat, 19 Nov 2016 20:23:23 +0100, Arnout Vandecappelle wrote:
[snip]
>> http://autobuild.buildroot.net/results/070ce21befbf3f0cd015ba0017b0a113ce985768
>> arm / cortex-a9	kvmtool-bed2bd9e1fbef581909...	glibc	
>>
>>>   LINK     guest/init
>>> make[1]: *** [guest/init] Segmentation fault (core dumped)  
>>
>>  Just two build failures like this, on two different machines. Parallel build
>> issue maybe?
> 
> Hum, I think I had a look, and I was able to reproduce IIRC. I really
> need to be better at taking notes about what I'm doing. I even think I
> had found what the issue was.

 I wasn't able to reproduce on my laptop (but I didn't do the whole build, just
kvmtool).


>> http://autobuild.buildroot.net/results/4fb4353bce614b64b30b05d06831e0d0f38a48dd
>> bfin / bf532	libarchive-3.2.1	uclibc	static
>>
>>> ./.libs/libarchive.a(archive_random.o): In function `_archive_random':
>>> libarchive/archive_random.c:(.text+0x158): undefined reference to `_pthread_mutex_lock'
>>> libarchive/archive_random.c:(.text+0x20a): undefined reference to `_pthread_mutex_unlock'  
>>
>>  pthread static linking problem with the ADI toolchain. Probably solved with
>> current uClibc-ng.
> 
> Let's kill this toolchain. I checked the other day the ADI toolchain
> SourceForge site, and they don't have any newer version.

 OK. But let's do it after the 2016.11 release, OK? Perhaps if/when I (or
someone else) do a respin of the external toolchain series?


[snip]
>> http://autobuild.buildroot.net/results/0be5e6b6194df5261b5ee569100f9eb2c899b695
>> powerpc / e500mc	lite-0.8.10	uclibc	static
>>
>>> /bin/sh ../libtool --tag=CC   --mode=link /home/buildroot/build/instance-0/output/host/usr/bin/powerpc-linux-gcc  -Wall -O3 -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -static -Werror-implicit-function-declaration  -static -o lite_bench bench.o ../leck/libleck.la ../lite/liblite.la -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib -ldirectfb -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib   -lz -lfusion -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib -ldirect -lpthread -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib   ../leck/libleck.la ../lite/liblite.la -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib -ldirectfb -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysr  
>>  oot/usr/lib   -lz -lfusion -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib -ldirect -lpthread -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib  
>>> /home/buildroot/build/instance-0/output/host/usr/bin/powerpc-linux-gcc -Wall -O3 -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -static -Werror-implicit-function-declaration -static -o lite_bench bench.o  -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib ../leck/.libs/libleck.a /home/buildroot/build/instance-0/output/build/lite-0.8.10/lite/.libs/liblite.a ../lite/.libs/liblite.a /home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libdirectfb.a /home/buildroot/build/instance-0/output/build/directfb-1.7.7/lib/fusion/.libs/libfusion.a /home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libfusion.a /home/buildroot/build/instance-0/output/build/directfb-1.7.7/lib/direct/.libs/libdirect.a /home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libdirect.a -lz -lrt /home/buildroot  
>>  /build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/lib/libstdc++.so -lpthread   -Wl,--rpath -Wl,/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/lib -Wl,--rpath -Wl,/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/lib
>>> libtool: link: warning: library `/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/lib/libstdc++.la' was moved.
>>> /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/lib/libstdc++.so'
>>> collect2: error: ld returned 1 exit status
>>> Makefile:378: recipe for target 'lite_bench' failed  
>>
>>  The linking with libstdc++.so is added by libtool and is caused by directfb.
>> Not sure what is happening here. This isn't the same thing as for ppc64le, is it?
> 
> I'm not entirely sure about that one, but it could be the following
> (usual problem) : your create a C program, that you compile with gcc,
> but you link it with a C++ library. With dynamic linking, it all works
> fine because your C++ library has a NEEDED on libstdc++.so, but it
> fails badly with static linking.

 But it actually _is_ linking with stdc++, thanks to libtool. Only it's using
the dynamic one instead of the static one.

 Regards,
 Arnout

> 
> There's no real way for your C application to know that one of the
> library it links with is written in C++, so how can it know that it
> should add -lstdc++ to the link command line, or alternatively use g++
> instead of gcc?
> 
> I raised this problem to the pkg-config developers a while ago (see
> https://lists.freedesktop.org/archives/pkg-config/2016-August/001053.html)
> and there wasn't a very good proposal to solve this. My proposal is to
> fix this by adding -lstdc++ in the Libs.private field of libraries
> implemented in C++.
> 
> 
>> http://autobuild.buildroot.net/results/ab240f93c6b2701c3df08b25d12a4b27b7a24451
>> i686 / i686	mplayer-1.3.0	glibc	
>>
>>> libavcodec/h264_cabac.c: In function 'decode_cabac_residual_nondc_internal.isra.5':
>>> libavcodec/x86/h264_i386.h:144:5: error: 'asm' operand has impossible constraints
>>>      __asm__ volatile(
>>>      ^  
>>
>>  I'm not really familiar with i386 assembly, but I suppose it's something that
>> doesn't work on i686.
> 
> This one is for Bernd or Gustavo to have a look.
> 
>> http://autobuild.buildroot.net/results/0ad82cc30cebe0ce9ea08b354c1dd939c356cbd9
>> mips64el / mips64	polarssl-1.2.19	uclibc	static
>>
>>> /home/peko/autobuild/instance-1/output/host/usr/mips64el-buildroot-linux-uclibc/sysroot/usr/lib/../lib64/libcrypto.a(c_zlib.o): In function `zlib_stateful_expand_block':
>>> c_zlib.c:(.text+0x78): undefined reference to `inflate'
>>> c_zlib.c:(.text+0x80): undefined reference to `inflate'  
>>
>>  The usual.
> 
> polarssl is supposed to go away (no longer maintained)
> 
>> http://autobuild.buildroot.net/results/845a1e990eae3cc8a148f846db4ac597ebaedb4a
>> x86_64 / atom	python-libconfig-b271c3d9da...	musl	
>>
>>> In file included from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/instance_holder.hpp:11:0,
>>>                  from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/object/pointer_holder.hpp:14,
>>>                  from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/to_python_indirect.hpp:10,
>>>                  from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/converter/arg_to_python.hpp:10,
>>>                  from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/call.hpp:15,
>>>                  from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/object_core.hpp:14,
>>>                  from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/args.hpp:25,
>>>                  from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python.hpp:11,
>>>                  from src/pylibconfig.cc:1:
>>> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/type_id.hpp: In instantiation of 'boost::python::type_info boost::python::type_id() [with T = const volatile _IO_FILE&]':
>>> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/converter/registered.hpp:91:42:   required from 'const boost::python::converter::registration& boost::python::converter::detail::registry_lookup2(T& (*)()) [with T = const volatile _IO_FILE]'
>>> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/converter/registered.hpp:98:30:   required from 'const boost::python::converter::registration& boost::python::converter::detail::registry_lookup1(boost::type<Target>) [with T = const volatile _IO_FILE&]'
>>> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/converter/registered.hpp:109:80:   required from 'const boost::python::converter::registration& boost::python::converter::detail::registered_base<const volatile _IO_FILE&>::converters'
>>> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/converter/arg_from_python.hpp:269:61:   required from 'boost::python::converter::pointer_arg_from_python<T>::pointer_arg_from_python(PyObject*) [with T = _IO_FILE*; PyObject = _object]'
>>> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/arg_from_python.hpp:70:18:   required from 'boost::python::arg_from_python<T>::arg_from_python(PyObject*) [with T = _IO_FILE*; PyObject = _object]'
>>> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/preprocessor/iteration/detail/local.hpp:37:9:   required from 'PyObject* boost::python::detail::caller_arity<2u>::impl<F, Policies, Sig>::operator()(PyObject*, PyObject*) [with F = void (pyConfig::*)(_IO_FILE*); Policies = boost::python::default_call_policies; Sig = boost::mpl::vector3<void, pyConfig&, _IO_FILE*>; PyObject = _object]'
>>> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/object/py_function.hpp:38:33:   required from 'PyObject* boost::python::objects::caller_py_function_impl<Caller>::operator()(PyObject*, PyObject*) [with Caller = boost::python::detail::caller<void (pyConfig::*)(_IO_FILE*), boost::python::default_call_policies, boost::mpl::vector3<void, pyConfig&, _IO_FILE*> >; PyObject = _object]'
>>> src/pylibconfig.cc:233:1:   required from here
>>> /home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/boost/python/type_id.hpp:84:9: error: invalid use of incomplete type 'struct _IO_FILE'
>>>          );
>>>          ^  
>>
>>  Missing #include in a boost header? Yegor?
> 
> This is a musl-only issue. _IO_FILE is only defined as an internal data
> structure in musl, while uClibc/glibc expose its definition. I think
> Boost Python is messing up with C library stuff it shouldn't have
> access to.
> 
> This should be brought to the musl developers to see what they think
> about it.
> 
> 
>> http://autobuild.buildroot.net/results/e0f6c2549ed79a8f099eb87e5812749ccc3a85be
>> i586 / pentium-mmx	ruby-2.3.1	musl	
>>
>>> linking miniruby
>>> array.o: In function `rb_ary_repeated_combination':
>>> array.c:(.text+0x2c08): undefined reference to `__stack_chk_fail_local'
>>> array.o: In function `rb_ary_repeated_permutation':
>>> array.c:(.text+0x2de0): undefined reference to `__stack_chk_fail_local'
>>> array.o: In function `rb_ary_combination':
>>> array.c:(.text+0x2fc7): undefined reference to `__stack_chk_fail_local'
>>> array.o: In function `rb_ary_permutation':
>>> array.c:(.text+0x3254): undefined reference to `__stack_chk_fail_local'
>>> array.o: In function `rb_ary_zip':
>>> array.c:(.text+0x6421): undefined reference to `__stack_chk_fail_local'
>>> bignum.o:bignum.c:(.text+0x1279): more undefined references to `__stack_chk_fail_local' follow
>>> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/5.4.0/../../../../i586-buildroot-linux-musl/bin/ld: miniruby: hidden symbol `__stack_chk_fail_local' isn't defined
>>> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/5.4.0/../../../../i586-buildroot-linux-musl/bin/ld: final link failed: Bad value  
>>
>>  It is configured with --disable-libssp, not sure what's going on here...
> 
> There is an issue with supporting SSP on musl/i586. It's yet another
> thing I started investigating but gave up. If I recall, some gcc
> patches were needed or something. At least something that makes you
> want to give up :)
> 
>> http://autobuild.buildroot.net/results/b2fe90ab02c3e0d9588f79499065635723824320
>> i586 / pentium-mmx	stunnel-5.36	musl	
>>
>>> stunnel-client.o: In function `connect_local':
>>> client.c:(.text+0x536): undefined reference to `__stack_chk_fail_local'  
>>
>>  Hm, looks awfully familiar :-)
> 
> Any package that wants SSP on musl/i586 fails this way.
> 
> 
>> http://autobuild.buildroot.net/results/8c5d39e90fedac98cf9a9d5ac35c683efc3892b9
>> microblazeel	vlc-2.2.4	uclibc	
>> http://autobuild.buildroot.net/results/432d0fb0bd872aa334069af17a0f41f9a4eb9633
>> microblazeel	vlc-2.2.4	uclibc	
>>
>>> video_output/video_output.c: In function 'ThreadDisplayPicture':
>>> video_output/video_output.c:1154:1: internal compiler error: in merge_overlapping_regs, at regrename.c:304
>>>  }
>>>  ^  
>>
>>  ICE. Perhaps just disable vlc on microblaze?
> 
> Yeah, probably the most reasonable solution. Who is going to use VLC on
> Microblaze anyway?
> 
> Thanks,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
