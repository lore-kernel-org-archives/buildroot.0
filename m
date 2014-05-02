From: Michal Sojka <sojka@merica.cz>
Date: Fri, 02 May 2014 17:37:19 +0200
Subject: [Buildroot] [PATCH] Rebuild busybox when an external config is
	updated
In-Reply-To: <53639BDE.4050009@zacarias.com.ar>
References: <1396469147-21713-1-git-send-email-sojka@merica.cz>
 <CAAXf6LVyQfj8Z=RQkfq_tyjN-e305bZSpKaOg5N5FpVSsc1Tbg@mail.gmail.com>
 <20140501203103.GA3231@free.fr> <87ha58corn.fsf@steelpick.2x.cz>
 <53639BDE.4050009@zacarias.com.ar>
Message-ID: <878uqkchu8.fsf@steelpick.2x.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gustavo,

On Fri, May 02 2014, Gustavo Zacarias wrote:
> On 05/02/2014 10:07 AM, Michal Sojka wrote:
>
>> I could definitely live with this conclusion, but on the other hand I
>> don't think that adding one more dependency is being "too smart". What
>> are the drawbacks of adding this functionality? If it is just adding the
>> same to other packages, I'm willing to do that. Quick grep suggests that
>> only the following packages have custom config files: at91bootstrap3.mk,
>> barebox.mk, ubi.mk, linux.mk, busybox.mk, freetype.mk, luarocks.mk,
>> qt.mk, uclibc.mk.
>
> Hi.
> I think i've already mentioned it in the past, but here it goes again.
> Because you'd need a full rebuild of packages that depend on busybox as
> well since we use DEPENDENCIES to make packages with superior
> functionality to that provided by busybox build afterwards to override
> it's functionality (logic = it's YES and better so do it).
> If you rebuild busybox without doing so for the other packages then your
> "reproducibly" goes down the drain since the "big and featured" binaries
> get overwritten by busybox (with the way busybox is installed at the
> moment) for a built project.

I understand that, but then "make busybox-menuconfig" has the same
problem, doesn't it? I agree that the word "reproducible" is a bit
overstatement, but my proposed change does not make buildroot worse than
it is now.

On Fri, May 02 2014, Danomi Manchego wrote:
> Ah, but that's where the busybox install script's "no clobber" feature
> is useful - it won't create links on top of existing files/links.
>
> I sent a patch [1] to the bb mailing list to add an option for this in
> the bb config menu, but got no reply thus far.  In the meanwhile, I've
> been using a simpler patch that just forces this feature on - it makes
> "make busybox-menuconfig" much safer.
>
> [1]  http://lists.busybox.net/pipermail/busybox/2014-April/080786.html

When my proposal is combined with Busybox's "no clobber" feature pointed
out by Danomi, this problem could go away completely. What do you think?

-Michal
