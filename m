From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Apr 2019 22:49:50 +0200
Subject: [Buildroot] [PATCH 06/10] infra/pkg-generic: introduce
 foo-show-info
In-Reply-To: <CAAXf6LU-j7zMLUc93J1rchu5BytrZL22L=vkTOwDgwMdCA-rqA@mail.gmail.com>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
 <6e3c4eccb009f45ccb25b549c88e6a6603091ddb.1554637858.git.yann.morin.1998@free.fr>
 <CAAXf6LU-j7zMLUc93J1rchu5BytrZL22L=vkTOwDgwMdCA-rqA@mail.gmail.com>
Message-ID: <20190411204949.GE2539@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thpmas DS. All,

On 2019-04-10 11:16 +0200, Thomas De Schampheleire spake thusly:
> El dom., 7 abr. 2019 a las 13:51, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
[--SNIP--]
> > Introduce a new rule, foo-show-info, that provides a properly formatted
> > output of all the meta-information about a package: name, type, version,
> > licenses, dependencies...
[--SNIP--]
> > +define $(2)_SHOW_INFO_VIRTUAL
> > +       "virtual": false,
> > +       "version": "$$($(2)_DL_VERSION)",
> > +       "licenses": "$$($(2)_LICENSE)",
> > +       "downloads": [
> > +       $$(foreach dl,$$($(2)_ALL_DOWNLOADS),
> > +               {
> > +                       "source": "$$(notdir $$(dl))",
> > +                       "URIs": [
> > +                       $$(call make-comma-list,
> > +                               $$(subst \|,|,
> > +                                       $$(call DOWNLOAD_URIS,$$(dl),$(2))
> > +                               )
> > +                       )
> > +                       ]
> > +               },
> > +       )
> > +       null
> > +       ],
> 
> So the 'null' serves as last element in the array and is only needed
> because JSON cannot handle the trailing comma, right?

Ah, right, I forgot to explain that part in the commit log, because it
does deserve some explanations, indeed. And yes, that's because JSON
does not allow for a trailing comma.

Comming up with a Makefile-based construct that did not require this
trick is not obvious, so I did resort on this null trick to generate a
valifd JSON output. If we require that jq is present, then we could
pipe that to jq to filter it out. But I'm not to keen on that...

> > +endef
> > +endif
> > +
> > +define $(2)_SHOW_INFO
> > +       "name": "$(1)",
> > +       "type": "$(4)",
> > +       $$($(2)_SHOW_INFO_VIRTUAL)
> > +       "depends on": [
> > +               $$(call make-comma-list,$$($(2)_FINAL_ALL_DEPENDENCIES))
> > +       ],
> > +       "dependency of": [
> > +               $$(call make-comma-list,$$($(2)_RDEPENDENCIES))
> > +       ]
> 
> It feels odd to me to not use single-word keys here. Why not use
> 'depends/rdepends', 'dependencies'/'rdependencies' or if you want
> dependencies/reverse_dependencies ? The naming 'rdepends' is already
> exposed to users 'make show-rdepends' so it makes sense to me to use
> the same naming.

OK for "dependendencies" vs. "reverse_dependencies".

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
