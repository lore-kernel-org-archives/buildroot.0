From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 07 Mar 2012 13:04:47 -0300
Subject: [Buildroot] [PATCH] Fix microperl
In-Reply-To: <20120307165035.6f9d0f84@skate>
References: <1330895345-16705-1-git-send-email-arnout@mind.be>
 <871up5o277.fsf@macbook.be.48ers.dk> <20120307090613.3b8e4a9a@skate>
 <d35484b93145763e6c0dcb6274f4954e@zacarias.com.ar>
 <20120307165035.6f9d0f84@skate>
Message-ID: <a6e919b55f72f1e8703f5fcb0d670697@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-07 12:50, Thomas Petazzoni wrote:

>> For the most part it checks for libc functions and presence of other
>> libs, and platform details (sizeof... and so on).
>> At the moment this would be "important" (not for me though) to get
>> target autoconf/automake going since there are new required modules
>> which are XS when the auto* packages were versioned bumped.
>
> Could you expand on this, because I'm not sure I got what you said.

It's like configure scripts do, except that perl has it's own build 
system.

>> The proper solution would probably be define the lowest denominator
>> for libc, say uclibc-0.9.31, generate a cache on a qemu/working
>> target and get that back into the package.
>
> A bit like what we do for ./configure scripts already, at the end of
> package/Makefile.in, correct?

Something similar but quite perl-specific for the reason stated above.
Once the perl Configure script runs it generates a config.sh file that 
contains all the needed definitions.
What microperl does is define a subset uconfig.sh file with the basics 
only which doesn't allow for XS modules to be built, basically a 
barebones interpreter.
The native way for perl to be built as a fully-fledged perl (sic) is to 
run the tests on the target host via ssh/telnet or some other method and 
fetch back the results to generate config.sh
The details of the target are basically stored in Config.pm and it's 
includes, that's the trick i use to build modules in 
MICROPERL_BUILD_EXTENSIONS by using host-perl overriding it's config 
with PERL5LIB.
Regards.
