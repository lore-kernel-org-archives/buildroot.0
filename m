From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 15:54:34 +0100
Subject: [Buildroot] [PATCH] jack2: Try better fix for NGREG problem
In-Reply-To: <1479739795-31046-1-git-send-email-abrodkin@synopsys.com>
References: <1479739795-31046-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20161121155434.728d1acb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Nov 2016 17:49:55 +0300, Alexey Brodkin wrote:
> After quite some time trying this and that we seem to have no
> better solution than proposed by Thomas back in the day [1].
> 
> The solution in question is to check [during jack2 configuration]
> if NGREG is exposed via ucontext.h and then use its value in
> source code later on. This replaces long and still growing list
> of architectures for which we explicitly escape usage of NGREG.
> 
> Just for reference [2] is my attempt to fix in in the other
> supposedly better way but with no luck because of the mess in
> kernel's UAPI headers.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2016-May/161785.html
> [2] http://lists.busybox.net/pipermail/buildroot/2016-June/162461.html
> 
> Still not sure if that works for every other architectures, so testing
> and Acks from all interested parties are much appreciated.

Unfortunately, I experimented with something like this some time ago,
and IIRC, it didn't work all architectures, because NGREG is not always
defined in <ucontext.h>, but can be defined in other header files (if I
recall). In the end, I think I ended up with something like the below,
but I don't remember if I tested it in all cases:

(As you can see, it dates back from May 2016...)
