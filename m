From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 10 Oct 2014 09:46:16 +0200
Subject: [Buildroot] Problems with uClicbc and libc.so.6
In-Reply-To: <20141009222020.5bd77d67@free-electrons.com>
References: <CA+TH9VnNeLUgYs5yahr3FNz6+bcz8A_KR_6390kcWUXv7LVxOA@mail.gmail.com>
 <20141009135427.63f010b0@free-electrons.com>
 <CA+TH9VnQmn=7qX9Ao2qST1z3Sr8uVsFBB5xe5ASrNCLBdo9GsQ@mail.gmail.com>
 <20141009150727.441ae173@free-electrons.com>
 <CA+TH9VnFAqd-4ZFQ3Bi2kcDD1rqX-de8BwvErpUxOhaytGF7EA@mail.gmail.com>
 <20141009180201.01d7ff1c@free-electrons.com>
 <CA+TH9Vnoy5ZeGG3h9VOLMFHCF1R3USboHG6jg2TMK1QakWy4Ww@mail.gmail.com>
 <20141009222020.5bd77d67@free-electrons.com>
Message-ID: <CA+TH9VkiMj5PNJaO1k2fHpEbjY2mgCDO9NmQtny7T4GVPpYX0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> It happens either with webclient.exe built using mcs on the host
> machine, or mcs on the target machine.

Yes, right. My fault, you should compile with gmcs that selects the
original 2.0 API version where the error is explicit and not
masquerade inside a nested try/cach.

gmcs mono webclinet.cs
mono webclient.exe http://www.google.com

> Another thing I've noticed is that the Mono installation is
> *huge*. /usr/lib/mono takes 132 MB. Is all of it necessary?

Yes and not! By default mono compiles all the libraries for each one
of the mono versions 2.0, 3.5, 4.0, 4.5, so the most part of the
library is duplicated inside each one of these folders.
You can of course delete which versions is unnecessary for you,
because you can compile against a specific mono library version using
a commandline tag.
If you think it's important, I can update my patch to offer a
selection of which mono version should be shipped into the target
folder, so reducing to the essential the libraries components.
Of course you can further shrink manually your mono installation by
delete libraries that you don't use, but this part is not easily
doable and it's an optimization step that only a software developer
can do basing on his software.

> Also, why do you have two packages, mono-managed and mono-native? One
> builds the stuff for the host, and one builds the stuff for the target.
> It could simply be one single package called mono, which builds both
> for the host and the target.

mono-native compiles the mono virtual machine, but without the
run-time libraries is not useful so much. mono-managed compiles mono
libraries source code (with .cs extension) to the various mono library
versions, but to make that step, a mono compiler must be used.
Probably I can do it inside a qemu instance, using the previously
compiled mono-native, but it will be very slow. Compiling mono library
with mcs on host instead on the target is not so much different,
because the assembly it produces is platform agnostic cause it runs on
mono virtual machine.

Thank you for your time!

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
