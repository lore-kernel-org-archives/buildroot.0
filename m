From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 19 Sep 2019 18:38:14 +0200
Subject: [Buildroot] [pkg-luarocks 3/6] pkg-luarocks: regen packages
 with external dependencies
In-Reply-To: <20190918211642.1517aa3f@windsurf>
References: <20190918061915.31250-1-francois.perrad@gadz.org>
 <20190918061915.31250-3-francois.perrad@gadz.org>
 <20190918093501.5b91d097@windsurf>
 <CAB0FRstytkW+C-PcTKXQubHJZRwryrGwHB5tr7j-4jwTZt6wCA@mail.gmail.com>
 <20190918211642.1517aa3f@windsurf>
Message-ID: <CAB0FRssGnc0G1XTb=SNEa=gONK42+L5gxife9QJQTS_P=v=SiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mer. 18 sept. 2019 ? 21:23, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a ?crit :

> On Wed, 18 Sep 2019 20:19:14 +0200
> Fran?ois Perrad <francois.perrad@gadz.org> wrote:
>
> > Yes, it looks redundant.
> > _BUILD_OPT contains a list of key/value,
> > the value is always the same ($(STAGING_DIR)/usr),
> > but the key (SQLITE_DIR in this case) depends of the rock.
> >
> > This is the LuaRocks way.
>
> I understand, but before your change such xyz_DIR were not needed, and
> now they are needed. This looks like a "regression" in the sense that
> things are worse than they were.
>
> Could you explain why the existing solution no longer works ?
>
>
Previously, there is in the config file:
    external_deps_dirs = { getenv('STAGING_DIR') .. [[/usr]] }
and this path was globally used.

The config file is common for host-luarocks and luarocks,
so this way is no longer doable.

`external_deps_dirs` has no equivalent as CLI option.
But for each external dependency `BAR`, a CLI option `BAR_DIR` is available
and must be set to `$(STAGING_DIR)/usr` (This is the LuaRocks way).

There are some explanations in the commit log 2/6.

If you look at the final point of the serie, the LuaRocks infrastructure is
greatly improved:
  - host-luarocks is now supported
  - luarocks.mk contains no longer the cross-compilation stuff
  - the macro _INSTALL_TARGET_CMDS in pkg-luarocks, contains all the
cross-compilation stuff (better design compatible with per-package folders)
  - luarocks is called without the full path of host-lua and without
LUAROCKS_RUN_ENV

Fran?ois


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190919/e09262f5/attachment.html>
