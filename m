From: Brendan Heading <brendanheading@gmail.com>
Date: Sun, 2 Aug 2015 23:39:02 +0100
Subject: [Buildroot] [PATCH RFC 1/1] package/libpthsem: cannot be sanely
	cross-compiled
In-Reply-To: <20150802221406.GL3647@free.fr>
References: <1438285530-320-1-git-send-email-brendanheading@gmail.com>
 <20150802221406.GL3647@free.fr>
Message-ID: <CA+BsyQ7sxr2SJmeJuSod1+GbeHiMyqv=WN0DwvtkhY=dUjmyxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I've tested the first reported build failure... And it builds fine for
> me... :-/
>
> Not to say that the result is correct, just that I can't reproduce the
> build failure.

Yann,

Thanks for reviewing my patch. I knew it would not fly, so I put it as
RFC to start a discussion on the best approach.

> All those tests that can not be determined at build time because they
> need to run programs should be forced-guessed,with the appropriate ac_cv
> variables.
>
> See for example the atk package, which has quite a bunch of those;
>     package/atk/atk.mk

Noted. I agree that this is a better approach.

> Now, if you look closely (not too closely, even!), you'll see that those
> errors are all occuring on a single autobuilder, the one from Nathaniel:
>
>     http://autobuild.buildroot.org/?reason=libpthsem-2.0.8
>
> So, I guess something from the environment causes the build failures.

Yes, I agree. I found the same problem that you did (issues with
reproducibility). Sometimes you get "Exec format error", others "file
not found" (which happens when there is a dynamic link problem).
Strangely, I could reproduce it on some architectures but not others.
But irrespective of this - the way that it is detecting features
cannot work in a cross-compiled environment. So I didn't waste a lot
of time characterising this in detail.

The big problem is the misdetection of the sjlj as you noted. To fix
this properly we're going to have to go through all the arches and
figure out what the correct value is ..

Brendan
