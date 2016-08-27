From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Aug 2016 00:14:49 +0200
Subject: [Buildroot] [PATCH 08/16 v3] core: do not hard-code inclusion
 of br2-external in Kconfig
In-Reply-To: <20160827220010.7063cd40@free-electrons.com>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <326c5c4a0a2b9cb4d4cb430791ce5aaf21185e95.1468750623.git.yann.morin.1998@free.fr>
 <20160827220010.7063cd40@free-electrons.com>
Message-ID: <20160827221448.GL5755@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-27 22:00 +0200, Thomas Petazzoni spake thusly:
> On Sun, 17 Jul 2016 12:34:28 +0200, Yann E. MORIN wrote:
> >  .PHONY: $(BUILD_DIR)/.br2-external.in
> >  $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
> > -	@touch $@
> > +	$(Q)( \
> > +		printf "#\n# Automatically generated file; DO NOT EDIT.\n#\n\n"; \
> > +		printf 'menu "User-provided options"\n'; \
> > +		printf '\tdepends on BR2_EXTERNAL != "support/dummy-external"\n\n'; \
> > +		printf 'source "%s/Config.in"\n\n' $$(cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd); \
> > +		printf 'endmenu # User-provided options\n'; \
> > +	) >$@
> 
> Shouldn't the logic that generates the .br2-external.in be moved to a
> shell script?
> 
> I'm generally in favor of having most of the logic in make, but here,
> it is really ugly. Did you try having this in a shell script?

Well, for the above, it's OK to move to a shell script, indeed.

But once we have multiple br2-external trees, we need, for each of them:
  - the path to the br2-external tree,
  - the name of that tree.

So, if offloading this to a script, we'd need to either:

  - construct a list of tuples of {name,path} to the script, maybe
    something like:

        MY_NAME:/path/to/my-name-ext/ FOO:/path/to/foo-ext/ ...
or
  - rescann and re-extract the names from each br2-external tree.

Not very nice in either cases... :-/

> Also, what about using readlink or realpath to convert the path to an
> absolute path?

You meant the "cd blabla && pwd" trick?

I kept it because that's the way it is done today...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
