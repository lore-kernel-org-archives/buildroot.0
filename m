From: Mitch Davis <mjd+buildroot@afork.com>
Date: Thu, 24 Jun 2010 22:37:53 +1000
Subject: [Buildroot] Host libraries - status
In-Reply-To: <20100624093829.33d0eaf1@surf>
References: <AANLkTil-7ims-WsQ2LeTvjmHhVCOUDtkWHpZjr9vT67U@mail.gmail.com> 
	<20100624093829.33d0eaf1@surf>
Message-ID: <AANLkTikiJkDyDLj932VbE-Nb2-Dy0fLQYZUofYfH_8Gc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 24, 2010 at 5:38 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> On Thu, 24 Jun 2010 12:21:28 +1000
> Mitch Davis <mjd+buildroot@afork.com> wrote:
>
>> One idea is to have a make var that says how to set the environment
>> when calling host binaries that we've compiled, something along the
>> lines of $(HOST_MAKE_ENV). ?For each package which calls a host exe
>> we've compiled, we can overload the calling of that executable with
>> that var, which would set LD_LIBRARY_PATH just for running that exe.
>
> We already tried this, see
>
> ?http://git.buildroot.net/buildroot/commit/?id=c1b6242fdcf2cff7ebf09fec4cc1be58963e8427
>
> Unfortunately, it was causing issues, so it got removed:
>
> ?http://git.buildroot.net/buildroot/commit/?id=0d1830b07db4ebfd14e77a258de6fb391e57e960

I see that LD_LIBRARY_PATH isn't just used to resolve libraries at run
time, it's also used by the linker to indicate where shared libs can
be found to link against.  No wonder it doesn't work :-(  I looked at
LD_RUN_PATH, and it seems it's just as bad...

>> Anyway, there may be poor people out there who, like me, are trying to
>> get 2010.05 working. ?I've attached a patch, that while it's not
>> ideal, it at least Works For Me[tm], and so it may be useful for
>> others. ?One problem with this solution is that people who need more
>> fonts than me would need to alter more .mk files, whereas setting
>> LD_LIBRARY_PATH at the same time as PATH wouldn't require this.
>
> I'm sorry, but this patch isn't correct, for two reasons:

Yes the patch isn't correct, and for several reasons.  Nevertheless,
it may be useful for some people until there's a proper fix.

Ok, how about instead of setting LD_LIBRARY_PATH globally, only
setting it temporarily when certain buildroot-builds-for-host binaries
(such as mkfontscale) get called?  (Actually, that's what my patch
does).  That way, the compile-time linker won't get confused.  How
many of these host bins are there?  Can we make some convenience
makefile variables that wrap this?  For example, have a var called
MKFONTSCALE which temporarily sets PATH and LD_LIBRARY_PATH then calls
mkfontscale?

Mitch.
