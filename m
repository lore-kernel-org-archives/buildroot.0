From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Sep 2013 06:37:17 +0200
Subject: [Buildroot] [PATCHv2 0/4] Add a BR2_EXTERNAL mechanism
In-Reply-To: <52376C45.1020406@mind.be>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <52376C45.1020406@mind.be>
Message-ID: <20130917063717.1b005fd2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 16 Sep 2013 22:38:29 +0200, Arnout Vandecappelle wrote:

>   I've taken a few days to let the dust settle on this patch series
> (and it seems it still hasn't settled...). After reading the entire
> series this time (instead of commenting before I understood what was
> happening exactly), I have two overall comments still. More comments
> will follow in individual patches.
> 
> 
> 1. Peter nacked all previous attempts of having this type of feature,
> so I think it's best if he gives an indication if this series has a
> chance of survival before we all spend more time on it.

Adding Peter in Cc on this one. I know he is a bit behind in terms of
reading the backlog of Buildroot e-mails (which has been enormous since
a few days).

I have the pretension of thinking that the currently proposed
implementation is simple enough to remain in the KISS spirit of
Buildroot. I believe that what prevented earlier implementation from
being merged was not so much that they allowed 'external packages',
but more due to their complexity. But honestly, I don't really remember
the implementation details of the previous proposals, so I might be
wrong on that one.

> 2. I really have a huge problem with the fact that the .config is no 
> longer complete, and that instead you have to explicitly provide
> extra command-line arguments to be able to reproduce the build. And
> it doesn't help that it behaves differently when you have an
> out-of-tree output directory (where the BR2_EXTERNAL is stored) than
> when you're using the default output directory. I'm actually very
> surprised that nobody else seems to have a problem with this. So for
> me, this gets a big Nack unless the BR2_EXTERNAL is stored in
> the .config.

On the wrapper Makefile that contains BR2_EXTERNAL, I am not convinced
it is a good idea, since as you mention it creates a difference whether
you're building out-of-tree from the output directory, or out-of-tree
but from the source directory. I think this is not good, and therefore
that BR2_EXTERNAL shouldn't be kept in the wrapper Makefile.

However, I still do not understand how storing BR2_EXTERNAL in .config
will clarify things for the user. Changing BR2_EXTERNAL affects what
'menuconfig' shows. So there is no way for 'menuconfig' to update what
it displays when the user changes the value of BR2_EXTERNAL without
exiting/re-running menuconfig, which sounds really odd.

To me, BR2_EXTERNAL= is a bit like O=, it's a local build decision that
you make to add some external configurations/external packages. Most
likely, if you have external packages in BR2_EXTERNAL, the defconfig
you have to use is also in BR2_EXTERNAL, so there's no way you can
forget to specify BR2_EXTERNAL on the command, since otherwise you
won't be able to even see your defconfig.

So while I do agree that being able to store BR2_EXTERNAL would be
nice, I don't see how it can be achieved in a way that isn't confusing
for the user.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
