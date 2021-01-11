From: Fabien LEHOUSSEL <fabien.lehoussel@medianesysteme.com>
Date: Mon, 11 Jan 2021 18:24:10 +0000
Subject: [Buildroot] BR2_PER_PACKAGE_DIRECTORIES : How to remove file
 installed from an other package
In-Reply-To: <20210111170337.GW3044608@scaer>
References: <D18CFEE6F046494E82855511759DF30ABCBDB7B3@ikhexmbxc02n01.ikhex.ikoula.com>
 <20210111170337.GW3044608@scaer>
Message-ID: <D18CFEE6F046494E82855511759DF30ABCBDB7EF@ikhexmbxc02n01.ikhex.ikoula.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for the answer.

I finally succeeded with XX_TARGET_FINALIZE_HOOKS in my package B to remove file installed by package A.

I don't want to use post-build script to delete this file because it depends of package B selection (which selects package A and does other actions).

Best Regards

Fabien Lehoussel 


-----Message d'origine-----
De?: Yann E. MORIN [mailto:yann.morin.1998 at free.fr] 
Envoy??: lundi 11 janvier 2021 18:04
??: Fabien LEHOUSSEL
Cc?: buildroot at busybox.net
Objet?: Re: [Buildroot] BR2_PER_PACKAGE_DIRECTORIES : How to remove file installed from an other package

Fabien, All,

On 2021-01-11 16:15 +0000, Fabien LEHOUSSEL spake thusly:
> I am trying to remove files installed from a dependency package without success.
> 
> Before using  BR2_PER_PACKAGE_DIRECTORIES, I did like this :
> 
> PACKAGE2_CONF_DEPENDENCIES = package1
> define PACKAGE2_INSTALL_TARGET_CMDS
>                 rm $(TARGET_DIR)/etc/init.d/XX
> endef
> 
> I have tried with hooks without success
> 
> What is the solution to make this work with BR2_PER_PACKAGE_DIRECTORIES ?

You don't.

Even without per-pacakge directories, you should *not* modify/remove
files from other packages from a package commands.

If you want to remove arbitrary files, then do so from a post-build
script:
    https://buildroot.org/downloads/manual/manual.html#rootfs-custom

Now, the technical reason why it worked without PPD, and why it does not
work with PPD:

  - without PPD, the opackages are configured/built/instaleld in a
    linear sequence, following the alphabetical order, with a guarantee
    that dependencies are built first. So, since this is a linear
    sequence, what hapenned hapenned and is finished [0]. And most
    importantly, they all use a single TARGET_DIR to install to.

  - with PPD, each package is configured/built/install in its own
    silesystem hierarchy (potential in parallel one to the others).
    Most importantly, they are each installed in their own TARGET_DIR.
    At the end of the build, each individual TARGET_DIR, from all
    packages, are gathered into the final TARGET_DIR, in aplhabetical
    order of the packages. So, files are only added to the final
    TARGET_DIR, they are not removed.

[0] Worse, it is already broken anyway when you reisntall the initial
package, e.g. 'make package1-reinstall; make', which would install that
file again, but your pakcage is not reinstalled so will not remove it.

Now, why is it a bad idea to meddle with files from other packages?

Well, first and foremost, because of PPD: if two packages touch (modify)
the same file, there is no way to tell what version of that file should
end in the target. Removing a file is just a slightly-degenerate case of
modifying a file. Say for example that packages A and B both provide
/etc/some.conf. Since they have no relationship to each other, they have
provided there own version of that file. How are we supopsed to merge
those two files? If we keep A's version, B is broken, and conversely. We
can't simply concatenate those files because they most probably have a
formatting of their own (each XML, JSON, binary blob, etc...).

Second, modifying a file breaks accountability: what package does a file
belong too? What package should I try to trim to fit in the allocated
flash? Is the license of that file acceptable for my product?

So, if you want to tweak your filesystem by removing arbitrary files,
use a post-build script. That is the only guaranteed-to-work solution.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
