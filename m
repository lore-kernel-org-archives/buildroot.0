From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Wed, 03 Jan 2018 11:06:57 -0500
Subject: [Buildroot] package "expat" fails to build without a C++
 compiler
In-Reply-To: <20171220235311.h34bqw7kefkvwazn@workotop.localdomain>
References: <20171219215831.4rlfcixr32ocr7tg@workotop.localdomain>
 <87r2rpcf5n.fsf@dell.be.48ers.dk>
 <20171220205345.lxrjqnwcpclvcwvi@workotop.localdomain>
 <87vah19jcu.fsf@dell.be.48ers.dk>
 <20171220235311.h34bqw7kefkvwazn@workotop.localdomain>
Message-ID: <87mv1vorj2.fsf@weeman.i-did-not-set--mail-host-address--so-tickle-me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Damien Riegel <damien.riegel@savoirfairelinux.com> writes:

>>  >> > I tried to build an image with the "expat" package in it, using a
>>  >> > toolchain without a C++ compiler. It fails with the following error:
>>  >> 
>>  >> >   configure: error: in `/home/dkc/src/buildroot/build/build/expat-2.2.4':
>>  >> >   configure: error: C++ preprocessor "/lib/cpp" fails sanity check
>>  >> 
>>  >> > Enabling C++ support fixed that error.
>>  >> 
>>  >> Hmm, can you have a look in expat-2.2.4/config.log to see what exactly
>>  >> goes wrong?
>>  >> 
>>  >> /lib/cpp is from your host toolchain, so enabling or not enabling C++
>>  >> support shouldn't matter.
>> 
>>  > /lib/cpp is the default value for the C++ preprocessor when '$CXX -E'
>>  > fails. When activating C++ support, $CXX points to a program that is
>>  > actually there, and CXXCPP doesn't default to /lib/cpp. That's why it
>>  > builds successfully when I activate C++ support.
>> 
>> Ok. CXX actually also points to an available program when C++ support
>> isn't available (it points to 'false').
>> 
>>  > I guess you have /lib/cpp on your machine and I don't.
>> 
>> :/
>> 
>> Out of interest, what Distribution are you using?
>
> Arch Linux

I have the same issue for months now and my local fix is the following:


    --- a/package/Makefile.in
    +++ b/package/Makefile.in
    @@ -266,6 +266,7 @@ TARGET_CONFIGURE_OPTS = \
            GCC="$(TARGET_CC)" \
            CPP="$(TARGET_CPP)" \
            CXX="$(TARGET_CXX)" \
    +       CXXCPP="/usr/bin/cpp" \
            FC="$(TARGET_FC)" \
            F77="$(TARGET_FC)" \
            RANLIB="$(TARGET_RANLIB)" \
    

How would you like this to be properly fixed?


Thanks,

        Vivien
