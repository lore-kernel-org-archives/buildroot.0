From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Oct 2014 12:34:49 +0200
Subject: [Buildroot] Problems with uClicbc and libc.so.6
In-Reply-To: <CA+TH9VkiMj5PNJaO1k2fHpEbjY2mgCDO9NmQtny7T4GVPpYX0g@mail.gmail.com>
References: <CA+TH9VnNeLUgYs5yahr3FNz6+bcz8A_KR_6390kcWUXv7LVxOA@mail.gmail.com>
 <20141009135427.63f010b0@free-electrons.com>
 <CA+TH9VnQmn=7qX9Ao2qST1z3Sr8uVsFBB5xe5ASrNCLBdo9GsQ@mail.gmail.com>
 <20141009150727.441ae173@free-electrons.com>
 <CA+TH9VnFAqd-4ZFQ3Bi2kcDD1rqX-de8BwvErpUxOhaytGF7EA@mail.gmail.com>
 <20141009180201.01d7ff1c@free-electrons.com>
 <CA+TH9Vnoy5ZeGG3h9VOLMFHCF1R3USboHG6jg2TMK1QakWy4Ww@mail.gmail.com>
 <20141009222020.5bd77d67@free-electrons.com>
 <CA+TH9VkiMj5PNJaO1k2fHpEbjY2mgCDO9NmQtny7T4GVPpYX0g@mail.gmail.com>
Message-ID: <20141010123449.04163d4c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Fri, 10 Oct 2014 09:46:16 +0200, Angelo Compagnucci wrote:

> Yes, right. My fault, you should compile with gmcs that selects the
> original 2.0 API version where the error is explicit and not
> masquerade inside a nested try/cach.
> 
> gmcs mono webclinet.cs
> mono webclient.exe http://www.google.com

Ok, thanks. I could now reproduce the problem.

The fix is pretty simple: edit /etc/mono/config and change the line:

<dllmap dll="libc" target="libc.so.6" os="!windows"/>

to:

<dllmap dll="libc" target="libc.so.0" os="!windows"/>

Then, it doesn't work for http://www.google.com because it redirects to
https://, and there is no SSL/TLS support in the Mono stuff. However,
with a pure http:// URL like http://autobuild.buildroot.org, it works
just fine.

> > Another thing I've noticed is that the Mono installation is
> > *huge*. /usr/lib/mono takes 132 MB. Is all of it necessary?
> 
> Yes and not! By default mono compiles all the libraries for each one
> of the mono versions 2.0, 3.5, 4.0, 4.5, so the most part of the
> library is duplicated inside each one of these folders.
> You can of course delete which versions is unnecessary for you,
> because you can compile against a specific mono library version using
> a commandline tag.
> If you think it's important, I can update my patch to offer a
> selection of which mono version should be shipped into the target
> folder, so reducing to the essential the libraries components.

I believe this would be useful.

> Of course you can further shrink manually your mono installation by
> delete libraries that you don't use, but this part is not easily
> doable and it's an optimization step that only a software developer
> can do basing on his software.

Yes, that's more something left for a post-build script I believe.

> mono-native compiles the mono virtual machine, but without the
> run-time libraries is not useful so much. mono-managed compiles mono
> libraries source code (with .cs extension) to the various mono library
> versions, but to make that step, a mono compiler must be used.
> Probably I can do it inside a qemu instance, using the previously
> compiled mono-native, but it will be very slow. Compiling mono library
> with mcs on host instead on the target is not so much different,
> because the assembly it produces is platform agnostic cause it runs on
> mono virtual machine.

I don't think you understood my comment properly: I do not claim there
is no need for a host package. I claim that you currently have your
host package (mono-managed) separate for the target package
(mono-native) and that this is not needed. They could be both in a
single package called mono, where the host variant of the package
builds the "managed" stuff, and the target variant builds the "native"
stuff. I'll adjust your patch to see if it's indeed possible and if it
is, I'll show you what it looks like.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
