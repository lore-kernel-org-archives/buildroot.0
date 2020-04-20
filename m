From: Mark Huang <mark.huang@cerebras.net>
Date: Mon, 20 Apr 2020 22:04:02 +0000
Subject: [Buildroot] [PATCH 1/1] package/fakedate: Skip other fakedates
 in PATH
In-Reply-To: <20200420211724.GM5035@scaer>
References: <E260DE97-5F54-42B7-96EB-80FFABAD9775@cerebras.net>
 <20200420211724.GM5035@scaer>
Message-ID: <9E3D68DB-99B2-433F-8F19-75C06F162336@cerebras.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Thanks for taking the time to review.

I actually tried an approach similar to your suggestion earlier. It works, but only if all of the fakedate copies agree on the algorithm, i.e. are fixed. I have a few production SDKs for various platforms in my PATH, some from older versions of buildroot. It will be a while until I can deprecate all of those SDKs out of my PATH. Until then, I can at least re-order the SDKs in my PATH such that the first one has a fixed fakedate. If fakedate doesn't try to recurse at all; i.e. if it just tries to find /usr/bin/date from the get go; then it will be more backward-compatible with the others. I considered a couple of other options as well:

1. Calling file(1) to see if $P/date is application/x-executable. Probably the most robust, but depends on file(1).
2. Installing fakedate as fakedate and date as a symlink to it, and checking to see if $P/date is a symlink to fakedate. The clearest and most future-compatible solution, but the same problem as above (not backward-compatible).

I decided that grepping for SOURCE_DATE_EPOCH was simpler.

I would also accept that having multiple buildroot SDKs in your PATH is not a valid use case, and could just maintain this patch in my own fork.

Thanks again,

--Mark

?On 4/20/20, 2:17 PM, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

    Mark, All,
    
    On 2020-04-20 18:56 +0000, Mark Huang spake thusly:
    > If multiple buildroot SDKs are in PATH before /usr/bin (usually accidentally,
    > but there may be some valid use cases for this), the first two copies of
    > fakedate will go into a loop calling each other without ever finding
    > /usr/bin/date. Grep for SOURCE_DATE_EPOCH in the candidate date binary, for
    > additional verification that it's not another copy of fakedate.
    > 
    > Signed-off-by: Mark Huang <mark.huang@cerebras.net>
    > ---
    >  package/fakedate/fakedate | 2 +-
    >  1 file changed, 1 insertion(+), 1 deletion(-)
    > 
    > diff --git a/package/fakedate/fakedate b/package/fakedate/fakedate
    > index a64d9b9..7b04568 100755
    > --- a/package/fakedate/fakedate
    > +++ b/package/fakedate/fakedate
    > @@ -23,7 +23,7 @@ DATE_BIN=false
    >  # Instead, find path of true `date' binary.
    >  for P in `echo $PATH | tr ':' ' '`; do
    >      if [ -x "$P/date" ]; then
    > -        if ! [ "$P/date" -ef "$0" ]; then
    > +        if ! [ "$P/date" -ef "$0" ] && ! grep -q SOURCE_DATE_EPOCH "$P/date" ; then
    
    Thanks for this patch. I don't think this to be reliable enough, though.
    
    Instead, what you want is iterate over PATH until you find ${0}, and
    then take the next 'date' that matches, something like (to be tested!):
    
        # Find the 'date' executable that comes *after* us in PATH, to avoid
        # inifinite recursion:
        found_self=false
        for P in `echo $PATH | tr ':' ' '`; do
            if [ -x "$P/date"]; then
                ${found_self} && { DATE_BIN="$P/date"; break; }
                [ "$P/date" -ef "$0" ] && found_self=true
            fi
        done
    
    Can you lok into tht, and respin, please? In the meantime, I've marked
    the patch as chagnes requested in patchwork.
    
    Regards,
    Yann E. MORIN.
    
    >              DATE_BIN="$P/date"
    >              break;
    >          fi
    > --
    > 1.8.3.1
    > 
    > 
    > _______________________________________________
    > buildroot mailing list
    > buildroot at busybox.net
    > http://lists.busybox.net/mailman/listinfo/buildroot
    
    -- 
    .-----------------.--------------------.------------------.--------------------.
    |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
    | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
    | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
    | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
    '------------------------------^-------^------------------^--------------------'
    
