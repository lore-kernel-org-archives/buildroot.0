From: Nicholas Walton <nwalton@aplopteng.com>
Date: Mon, 23 Nov 2009 12:39:31 -0800
Subject: [Buildroot] How do I configure the kernel?
In-Reply-To: <heepmc$umt$1@ger.gmane.org>
References: <he74ti$hbd$1@ger.gmane.org>
	<b680c1c10911201430s25dadd6aj8d1c48afaff91445@mail.gmail.com> 
	<b680c1c10911201435k3e8e6988pea7dcaaa301ee5d7@mail.gmail.com> 
	<he7s4s$330$1@ger.gmane.org> <87tywmffxl.fsf@macbook.be.48ers.dk> 
	<heemnr$jrk$1@ger.gmane.org> <heepmc$umt$1@ger.gmane.org>
Message-ID: <b680c1c10911231239t2e953a40q9eaebdc1daaf72be@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 23, 2009 at 12:01 PM, Grant Edwards
<grant.b.edwards@gmail.com> wrote:
> On 2009-11-23, Grant Edwards <grant.b.edwards@gmail.com> wrote:
>> On 2009-11-22, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>
>>> Grant> The next question was going to be where do I put a kernel
>>> Grant> .config file if I already have one I want to use. ?I can
>>> Grant> probably do a "find" to search for files named .config and
>>> Grant> figure out which is the right one. Then I assume I do "make
>>> Grant> linux26-oldconfig"?
>>>
>>> Use the LINUX26_KCONFIG environment variable, similar to
>>> BUSYBOX_CONFIG_FILE / UCLIBC_CONFIG_FILE. I'll also update the doc about
>>> that one.
>>
>> Sorry to be so dense, but I still don't get it. ?I've got a
>> .config file I want to use as the starting point for a
>> "make oldconfig". ?I can point LINUX26_KCONFIG at that .config
>> file, but how do I do the "make oldconfig" step?
>
> I got a working kernel by
>
> ?0) pick the arch, board, target filesystem options, etc.
> ?1) do a "make" and build everything (including a non-working kernel)
> ?2) overwrite output/build/linux-2.6.30.2/.config with my old
> ? ?but "working" config file.
> ?3) "make ARCH=arm oldconfig" in the ?output/build/linux-2.6.30.2
> ? ?directory
>
> That doesn't feel like the proper way to do it, but it seems to
> have worked

That does work, but a more direct way would be to do the linux
configuration through buildroot.

~/buildroot % make menuconfig
~/buildroot % make linux26-menuconfig
~/buildroot % cp old-linux.config  output/build/linux-$version/.config
~/buildroot % make linux26-$either_config
~/buildroot % make

and finally

~/buildroot % make linux26-update

to copy output/build/linux-$version/.config to
target/device/$whatever/linux-$version.config, which unlike output/ is
not .gitignore'd.

Nicholas
