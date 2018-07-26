From: Hao HU <huhao526200@gmail.com>
Date: Thu, 26 Jul 2018 15:02:00 -0500 (CDT)
Subject: [Buildroot] [PATCH v6 4/4] chromium: new package
In-Reply-To: <CAMWSM7ikcADGP3Y7_wpSjot8fD_OA_v+R7bZf3fD+APRR-Kc1A@mail.gmail.com>
References: <20180710234212.4297-1-joseph.kogut@gmail.com>
 <20180710234212.4297-5-joseph.kogut@gmail.com>
 <1532611912386-0.post@n4.nabble.com>
 <CAMWSM7ikcADGP3Y7_wpSjot8fD_OA_v+R7bZf3fD+APRR-Kc1A@mail.gmail.com>
Message-ID: <1532635320669-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joseph,


Joseph Kogut wrote
> Hi Hao,
> 
> On Thu, Jul 26, 2018 at 6:37 AM Hao HU &lt;

> huhao526200@

> &gt; wrote:
>>
>> Hello Joseph,
>>
>> I have applied your v6 patch to the Buildroot 2018.05 and wanted to build
>> the chrome in a x86 arch.
>>
>> The Target option is like this :
>>
>> /Target Architecture  : i386
>> Target Architecture Variant i586/
>>
>> And I have added the following in the lld.mk
>>
>> HOST_LLD_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
>> -DLLVM_DYLIB_COMPONENTS=all
>>
>> +ifeq ($(BR2_PACKAGE_CHROMIUM_PROPRIETARY_CODECS),y)
>> +CHROMIUM_OPTS += proprietary_codecs=true ffmpeg_branding=\"Chrome\"
>> +endif
>>
>> And finally I have comment the following in the chromium.mk
>>
>> +ifeq ($(BR2_PACKAGE_CHROMIUM_PROPRIETARY_CODECS),y)
>> + # CHROMIUM_OPTS += proprietary_codecs=true ffmpeg_branding=\"Chrome\"
>> +endif
>>
> 
>>I'm not sure what the intent is here. Chromium codec options belong in
>>the Chromium makefile, not the LLD makefile. Were you encountering a
>>build error related to enabling Chromium proprietary codecs?
> 
> I was encountering the build error like this when I build the object files
> of chromium:
/
> In file included from ../../third_party/ffmpeg/libavcodec/h264_cabac.c:36:
> In file included from
> ../../third_party/ffmpeg/libavcodec/cabac_functions.h:46:
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:193:9: error: inline
> assembly requires more registers than available
>         BRANCHLESS_GET_CABAC("%0", "%q0", "(%4)", "%1", "%w1",
>         ^
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:143:9: note: expanded from
> macro 'BRANCHLESS_GET_CABAC'
>         "movzbl "statep"    , "ret"                                    
> \n\t"\
>         ^
> error: register allocation failed: maximum depth for recoloring reached.
> Use -fexhaustive-register-search to skip cutoffs
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:193:9: error: inline
> assembly requires more registers than available
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:143:9: note: expanded from
> macro 'BRANCHLESS_GET_CABAC'
>         "movzbl "statep"    , "ret"                                    
> \n\t"\
>         ^
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:193:9: error: inline
> assembly requires more registers than available
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:143:9: note: expanded from
> macro 'BRANCHLESS_GET_CABAC'
>         "movzbl "statep"    , "ret"                                    
> \n\t"\
>         ^
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:193:9: error: inline
> assembly requires more registers than available
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:143:9: note: expanded from
> macro 'BRANCHLESS_GET_CABAC'
>         "movzbl "statep"    , "ret"                                    
> \n\t"\
>         ^
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:193:9: error: inline
> assembly requires more registers than available
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:143:9: note: expanded from
> macro 'BRANCHLESS_GET_CABAC'
>         "movzbl "statep"    , "ret"                                    
> \n\t"\
>         ^
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:193:9: error: inline
> assembly requires more registers than available
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:143:9: note: expanded from
> macro 'BRANCHLESS_GET_CABAC'
>         "movzbl "statep"    , "ret"                                    
> \n\t"\
>         ^
> error: register allocation failed: maximum depth for recoloring reached.
> Use -fexhaustive-register-search to skip cutoffs
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:193:9: error: inline
> assembly requires more registers than available
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:143:9: note: expanded from
> macro 'BRANCHLESS_GET_CABAC'
>         "movzbl "statep"    , "ret"                                    
> \n\t"\
>         ^
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:193:9: error: inline
> assembly requires more registers than available
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:143:9: note: expanded from
> macro 'BRANCHLESS_GET_CABAC'
>         "movzbl "statep"    , "ret"                                    
> \n\t"\
>         ^
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:193:9: error: inline
> assembly requires more registers than available
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:143:9: note: expanded from
> macro 'BRANCHLESS_GET_CABAC'
>         "movzbl "statep"    , "ret"                                    
> \n\t"\
>         ^
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:193:9: error: inline
> assembly requires more registers than available
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:143:9: note: expanded from
> macro 'BRANCHLESS_GET_CABAC'
>         "movzbl "statep"    , "ret"                                    
> \n\t"\
>         ^
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:193:9: error: inline
> assembly requires more registers than available
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:143:9: note: expanded from
> macro 'BRANCHLESS_GET_CABAC'
>         "movzbl "statep"    , "ret"                                    
> \n\t"\
>         ^
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:193:9: error: inline
> assembly requires more registers than available
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:143:9: note: expanded from
> macro 'BRANCHLESS_GET_CABAC'
>         "movzbl "statep"    , "ret"                                    
> \n\t"\
>         ^
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:193:9: error: inline
> assembly requires more registers than available
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:143:9: note: expanded from
> macro 'BRANCHLESS_GET_CABAC'
>         "movzbl "statep"    , "ret"                                    
> \n\t"\
>         ^
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:193:9: error: inline
> assembly requires more registers than available
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:143:9: note: expanded from
> macro 'BRANCHLESS_GET_CABAC'
>         "movzbl "statep"    , "ret"                                    
> \n\t"\
>         ^
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:193:9: error: inline
> assembly requires more registers than available
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:143:9: note: expanded from
> macro 'BRANCHLESS_GET_CABAC'
>         "movzbl "statep"    , "ret"                                    
> \n\t"\
>         ^
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:193:9: error: inline
> assembly requires more registers than available
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:143:9: note: expanded from
> macro 'BRANCHLESS_GET_CABAC'
>         "movzbl "statep"    , "ret"                                    
> \n\t"\
>         ^
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:193:9: error: inline
> assembly requires more registers than available
> ../../third_party/ffmpeg/libavcodec/x86/cabac.h:143:9: note: expanded from
> macro 'BRANCHLESS_GET_CABAC'
>         "movzbl "statep"    , "ret"                                    
> \n\t"\
>         ^
> fatal error: too many errors emitted, stopping now [-ferror-limit=]
> clang: error: unable to execute command: Segmentation fault
> clang: error: clang frontend command failed due to signal (use -v to see
> invocation)
> clang version 6.0.0 (tags/RELEASE_600/final)
> Target: i586-buildroot-linux-gnu
> Thread model: posix
> InstalledDir:
> /home/as_huhao/eolane/x2m/buildroot-2018.05-IHMI/output/host/bin
> clang: note: diagnostic msg: PLEASE submit a bug report to  and include
> the crash backtrace, preprocessed source, and associated run script.
> clang: note: diagnostic msg: 
> ********************
/
> 
/
> PLEASE ATTACH THE FOLLOWING FILES TO THE BUG REPORT:
> Preprocessed source(s) and associated run script(s) are located at:
> clang: note: diagnostic msg: /tmp/h264_cabac-e9fdc6.c
> clang: note: diagnostic msg: /tmp/h264_cabac-e9fdc6.sh
> clang: note: diagnostic msg:
/
> 
> 
> So I have added the comment # CHROMIUM_OPTS += proprietary_codecs=true
> ffmpeg_branding=\"Chrome\" in the chromium.mk , which means removing the 
/
> proprietary_codecs=true 
> ffmpeg_branding=\"Chrome\"
/
> 
> in the args.gn of the chromium
> 
> And it worked and until it finished building all the .o files of chromium
> 
> 
>> But now there is still a problem
>>
>> /home/as_huhao/eolane/x2m/buildroot-2018.05-IHMI/output/host/bin/ld.lld:
>> error: can't create dynamic relocation R_386_32 against local symbol in
>> readonly segment; recompile object files with -fPIC
>> >>> defined in
>> obj/third_party/ffmpeg/libffmpeg_yasm.a(ffmpeg_yasm/dct32.o)
>> >>> referenced by ../../third_party/ffmpeg/libavcodec/x86/dct32.asm
>> >>>               ffmpeg_yasm/dct32.o:(ff_dct32_float_sse) in archive
>> >>> obj/third_party/ffmpeg/libffmpeg_yasm.a
>>
> 
>>I've encountered the same issue, and I'm still working on a solution,
>>which is why I haven't submitted v7 of this patchset. Apparently the
>>Chromium team compiles i386 builds with GNU gold instead of LLD. LLD
>>is more strict, and by default errors out when trying to dynamically
>>relocate symbols in read only segments.
> 
>>Consequently, the upstream build is broken on i386 when linking with LLD.
> 
>> could you please tell me how to fix this problem?
>>
> 
>>I'm testing a couple of solutions. In the mean time, try setting
>>use_gold=false in CHROMIUM_OPTS, and let me know if that helps.
> 
> 
> But when it link to the chrome it still had the problem 
/
>  /home/as_huhao/eolane/x2m/buildroot-2018.05-IHMI/output/host/bin/ld.lld:
>  error: can't create dynamic relocation R_386_32 against local symbol in
>  readonly segment; recompile object files with -fPIC
>  >>> defined in
> obj/third_party/ffmpeg/libffmpeg_yasm.a(ffmpeg_yasm/dct32.o)
>  >>> referenced by ../../third_party/ffmpeg/libavcodec/x86/dct32.asm
>  >>>               ffmpeg_yasm/dct32.o:(ff_dct32_float_sse) in archive
>  >>> obj/third_party/ffmpeg/libffmpeg_yasm.a
/
> 
> So I tried to add the following statement in the lld.mk
/
> HOST_LLD_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
> -DLLVM_DYLIB_COMPONENTS=all
/
>  
> 
> But it still not worked.
> 
> And I will try to setting 
> use_gold=false in CHROMIUM_OPTS
> 
> And I will tell you the result.
> 
> If you fix the problem, please tell me as soon as possible, because I am
> in a hurry to finish my project.
> 
> Thank you very much.
> 
> Hao
> _______________________________________________
> buildroot mailing list

> buildroot@

> http://lists.busybox.net/mailman/listinfo/buildroot





--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
