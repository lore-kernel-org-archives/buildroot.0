From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 21 Feb 2019 14:23:55 -0600
Subject: [Buildroot] [PATCH] package/proftpd: require threads
In-Reply-To: <ba989973-2303-ddda-ca3c-bceb90ea6bec@mind.be>
References: <1550694551-61136-1-git-send-email-matthew.weber@rockwellcollins.com>
 <ba989973-2303-ddda-ca3c-bceb90ea6bec@mind.be>
Message-ID: <CANQCQpZozfmuWOa9yo6AG5PssJtPMkvgU83qouPacCJ3M5ArMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,


On Wed, Feb 20, 2019 at 3:57 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 20/02/2019 21:29, Matt Weber wrote:
> > Fixes
> > http://autobuild.buildroot.net/results/9c25c3cb3cf93b76c0538c5376a803641bf6575b
>
>  proftpd hasn't been updated in a long time, yet this issue only appeared
> recently. It was triggered by the update of the toolchains.

Yep,  I also noticed I could not reproduce it by explicitly building
the package (make proftpd).  Had to let things fall into some
undefined order to get it to fail. (make all)

>
>  I'm not sure what exactly differs between the previous toolchains and the
> current toolchains, but it is clear that proftpd incorrectly links with
> -lpthread. It doesn't actually use threads itself. It only adds -lpthread if it
> is required for mysql, postgresql or openssl.
>
>  mysql depends on threads, so that's not it.
>
>  postgresql is not selected in the failing build, so I didn't look at that.
>
>  openssl is selected, so that's the culprit. configure.in contains the following
> fragment for it:
>

[snip]

>
>  I *think* we can get away with just passing --without-openssl-cmdline due to
> the strange and intricate way that that option ends up being used by the
> configure script. But it would have to be tested :-)

I'll kick something off and see.

Matt
