From: Shawn Goff <shawnjgoff@gmail.com>
Date: Mon, 29 Oct 2012 20:26:19 -0400
Subject: [Buildroot] Topics for the Buildroot Developers meeting
In-Reply-To: <20121029233815.62dad9b3@skate>
References: <20121029194314.7545a446@skate>
 <CABYt4-a-3ozfyg-6dRg35vSAv-u8czNyi4cZ=QngtAND0jhcyA@mail.gmail.com>
 <20121029233815.62dad9b3@skate>
Message-ID: <CABYt4-Y2PhccywudDkRf7otCPqR_C59gkuqBWxxwuU7Pzjo7Fw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 29, 2012 at 6:38 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> On Mon, 29 Oct 2012 18:30:01 -0400, Shawn Goff wrote:
>> From the discussion page:
>> > Make it possible to do a 'target-clean', as a replacement of uninstall. Will this even work at all? Proposed by Arnout Vandecappelle
>>
>> This would be amazing.
>>
>> I had a quick chat in #ptxdist today, and it seems that's what they do
>> - they have separate stages, including a compile, install, and
>> targetinstall. The install installs the package into a
>> project-specific directory, and targetinstall creates an ipkg and
>> installs the package's relevant files to the root filesystem. When you
>> need to remove a package, you unselect it from the config and rebuild
>> the rootfs.
>
> Except that it doesn't work properly, even in PTXdist (as far as I
> know, of course). We had a discussion about this last year at ELCE with
> PTXdist developers. Basically, do the following:
>
>  * Build program foo with OpenSSL support (the OpenSSL support in foo
>    is optional, foo can work without OpenSSL). Both foo and openssl are
>    installed in the target.
>
>  * Enjoy foo with OpenSSL on your target, you're happy.
>
>  * Now, remove OpenSSL from your target.
>
> Beng, "foo" no longer works, because a library it is linked against no
> longer exists, and "foo" has not been rebuilt without OpenSSL support.
> As far as I know, PTXdist doesn't keep track of reverse dependencies
> when removing a package, and that can lead to invalid root filesystems.
>
> That's the precise reason why we decided /not/ to support packages in
> Buildroot: solving this problem completely is very complicated, and we
> thought it is better to not solve the problem than to solve it in half.

Yes, but I (and probably 90% or so?) of the people who use Buildroot
are aware enough to know that yanking out a dependency can mess with
things. And when the problem occurs, 99% of the people who use
buildroot can solve it by themselves when the problem happens. There
is even a very well-known distribution that people actually use as
their main system that doesn't do any dependency checking.

Maybe it could be an undocumented target? Maybe it could be documented
with big warnings around it?
