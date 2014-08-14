From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 14 Aug 2014 10:22:42 +0100
Subject: [Buildroot] Some Perl modules fail to cross-compile
In-Reply-To: <CAB0FRst4_dcG1GWQXAOBBTc1QqeV9-ZE+La1VPL+XiPr==uwGw@mail.gmail.com>
References: <20140813063010.CD21010118A@stock.ovh.net>	<53EB535B.60301@imgtec.com>
 <CAB0FRst4_dcG1GWQXAOBBTc1QqeV9-ZE+La1VPL+XiPr==uwGw@mail.gmail.com>
Message-ID: <53EC7FE2.40603@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/13/2014 05:50 PM, Fran?ois Perrad wrote:
> 2014-08-13 14:00 GMT+02:00 Vicente Olivert Riera <Vincent.Riera@imgtec.com>:
>> The affected modules are:
>>
>>   perl-gd
>>   perl-net-ssleay
>>   perl-xml-libxml
>>
>> The build system of these modules have a "use Config;" in the Makefile.PL.
>> Given that we are cross-compiling, the Perl program used to run that
>> Makefile.PL is the host's Perl program (because we can't run MIPS Perl in
>> our x86_64 machine, for instance), so the %Config read only variable
>> provided by the Config module contains all the information that the
>> Configure program had during the Perl build time (in our case, the host's
>> Perl). Then, the build system fills the OPTIMIZE variable (only if it's
>> empty) with some flags taken from that %Config variable, so some things like
>> "-mtune=generic" or "-m64" can end into the OPTIMIZE variable and cause a
>> compilation failure for target architectures which don't support those
>> flags.
>>
>> I have reported this bug upstream. Please read the comments:
>>    https://rt.cpan.org/Public/Bug/Display.html?id=97834
>>
>> My proposal to fix these three packages is to append the OPTIMIZE variable
>> to the configure options and set it to -mtune=$(BR2_GCC_TARGET_ARCH) to
>> avoid the OPTIMIZE variable get filled with incompatible flags.
>>
>> I have the patches ready and they work, so, if you think this is a valid
>> solution, just tell it to me and I will send the patches ASAP.
>>
>
> The host perl must load the host Config.pm.
> So, in order to cross compiling, we must overload all variables in the
> command line.
> Currently, only CCFLAGS/ccflags is set in package/pkg-perl.mk, in the same way,
> we could also set OPTIMIZE with " ".

I don't mind if we fix this by patching the .mk files of the three 
affected packages, or by patching the BR perl-package build system.

In case if we adopt the second solution (yours), don't you think it's 
better to set the OPTIMIZE variable to "-mtune=$(BR2_GCC_TARGET_ARCH)" 
instead of just " "?

> Fran?ois
>
>> Thanks.
>> --
>> Vincent
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Vincent
