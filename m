From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Jun 2019 09:47:13 +0200
Subject: [Buildroot] [RFC PATCH] download/git: ban branch references
In-Reply-To: <20190621173653.3e3c2d89@donbot>
References: <20190619151817.6331-1-john@metanate.com>
 <20190619163420.1a46c7eb@donbot> <20190620163946.GJ2216@scaer>
 <20190621173653.3e3c2d89@donbot>
Message-ID: <20190622074713.GB13664@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

John, All,

On 2019-06-21 17:36 +0100, John Keeping spake thusly:
> We can then filter out non-tags with:
>     case $(git rev-parse --symbolic-full-name "${cset}") in

Need for 2>/dev/null or there is a big warning printed (see below).

>         refs/tags/*
>             : ok
>             ;;
>         refs/*
>             printf >&2 "Refusing to use Git branch '%s'.\n" "${cset}"
>             ;;
>         # Anything else is not a ref, must be a raw hash which is ok.

That's wrong, because branches may pre-exist from git-clones that we do
currently.

For example, I have a local git clone of linux-firmware, which has:

    $ git branch
    * 1baa34868b2c0a004dc595b20678145e3fff83e7
      44d4fca9922a252a0bd81f6307bcc072a78da54a
      d87753369b82c5f362250c197d04a1e1ef5bf698

    $ git rev-parse --symbolic-full-name 1baa34868b2c0a004dc595b20678145e3fff83e7
    warning: refname '1baa34868b2c0a004dc595b20678145e3fff83e7' is ambiguous.
    Git normally never creates a ref that ends with 40 hex characters
    because it will be ignored when you just specify 40-hex. These refs
    may be created by mistake. For example,

      git checkout -b $br $(git rev-parse ...)

    where "$br" is somehow empty and a 40-hex ref is created. Please
    examine these refs and maybe delete them. Turn this message off by
    running "git config advice.objectNameWarning false"
    refs/heads/1baa34868b2c0a004dc595b20678145e3fff83e7

    $ git rev-parse --symbolic-full-name 1baa34868b2c0a004dc595b20678145e3fff83e7 2>/dev/null
    refs/heads/1baa34868b2c0a004dc595b20678145e3fff83e7

So, 1baa34868b2c0a004dc595b20678145e3fff83e7 is the sha1 we curently use
in Buildroot, the two others we used in the past.

So, your code snippet above woud break the build. We have a single
option, really, which is to try and remove the local branch before
checking if the cset is a branch.

So, my position is that the plan stays basically the same:

  - get rid of special refs. As I already explained, we already have a
    mechanism to catter for that use-case: override-srcdir;

  - remove local branches;

  - refuse branches.

Regards,
Yann E. MORIN.

>     esac
> 
> What do you think?
> 
> 
> Regards,
> John
> 
> 
> [1] http://buildroot-busybox.2317881.n4.nabble.com/PATCH-0-3-download-detect-and-refuse-git-branch-by-name-td200050.html

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
