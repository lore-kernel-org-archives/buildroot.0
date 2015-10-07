From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Oct 2015 16:40:44 +0100
Subject: [Buildroot] Buildroot developer meeting report
In-Reply-To: <5611AC6C.3060007@mind.be>
References: <5611AC6C.3060007@mind.be>
Message-ID: <20151007154044.GA4030@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

On 2015-10-04 23:47 +0100, Arnout Vandecappelle spake thusly:
>  As you will have noticed from the mailing list traffic, it's been a very busy
> two days at the Buildroot developer meeting in Dublin. You can find the full
> report at [1].
[--SNIP--]

As part of the discussions came the subject of supporting multiple
br2-external trees at once.

The proposal I sent earlier was deemed to introduce too much complexity,
and Peter suggested we do it with "a script that will generate a bunch
of symlinks into a single directory, and use that directory as the
traditional br2-external."

So, I've spent most of my spare time since then to try to implement that
proposal, and made quite some progress, up to the point that I believe
this is not a doable solution. Although it seems nice on paper, it is
broken by design.

For example, take those two br2-external trees as a simple example (only
interesting files are listed):

    br2-ext-1/
        external.mk
            include $(BR2_EXTERNAL)/foo/foo.mk
        foo/
            foo.mk
                blabla package stuff in here
            

    br2-ext-2/
        external.mk
            include $(BR2_EXTERNAL)/*/*.mk


Now, when we create the "shadow copy" full of symlinks, we inevitably
have to include those two external.mk files, because they may contain
more than include statements (like custom local rules, or custom macros,
or whatever; we always said that users were free to provide "even custom
configuration options and make logic" in there).


Now, since we're using a shadow copy, BR2_EXTERNAL at runtime will be
pointing to that shadow copy, so what happens in that case is that the
second external.mk will re-include foo/foo.mk

So far, this is not really a problem. Except we now want to ensure that
a package is not defined multiple times, to avoid a br2-external tree
redefining a package in Buildroot or in another br2-external tree.

But since foo/foo.mk is included twice, the second time will trigger the
re-definition check and we would abort.


There are not many solutions to this, but the more we try to fix this,
the more complex and fragile the code is getting. And worse, it would
inevitably break existing br2-external trees, which we are trying hard
to keep working without modification to those.


So, I'm calling the symlink (or "shadow copy") solution a dead-end out of
which I can't see an easy path.


Input most welcome.

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
