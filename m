From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jul 2020 14:15:24 +0200
Subject: [Buildroot] [PATCH buildroot-test] scripts/autobuild-run:
 properly delete output dir even with write-protected folders
In-Reply-To: <20200718205511.GQ18825@scaer>
References: <20200718201836.2408554-1-thomas.petazzoni@bootlin.com>
 <20200718205511.GQ18825@scaer>
Message-ID: <20200719121524.GU18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-07-18 22:55 +0200, Yann E. MORIN spake thusly:
> On 2020-07-18 22:18 +0200, Thomas Petazzoni spake thusly:
> > We're already deleting the output directory before a new build with
> > "rm -rf" so that write protected files are removed as well, which
> > shutil.rmtree() doesn't do.
> > 
> > However "rm -rf" fails on write protected folders.
[--SNIP--]
> >          if os.path.exists(self.outputdir):
> > -            # shutil.rmtree doesn't remove write-protected files
> > -            subprocess.call(["rm", "-rf", self.outputdir])
> > +            subprocess.call(["chmod", "-R", "+w", self.outputdir])
> > +            shutil.rmtree(self.outputdir)
> 
> Why can't we do as suggested in the docs:
>     https://docs.python.org/3/library/shutil.html#rmtree-example
> 
>     def rm_ro(f, p, _):
>         os.chmod(p, stat.S_IWRITE)
>         f(p)
> 
>     shutil.rmtree(self.outputdir, onerror=rm_ro)

We might need to be a little bit more careful, though:

    def rm_ro(f, p, _):
        os.chmod(os.path.dirname(p), stat.S_IWRITE)
        os.chmod(p, stat.S_IWRITE)
        f(p)

    shutil.rmtree(self.outputdir, onerror=rm_ro)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
