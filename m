From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 15 Jan 2014 11:49:14 +0100
Subject: [Buildroot] [PATCH] luarocks: fix compilation on 64bits
In-Reply-To: <874n55wo2y.fsf@dell.be.48ers.dk>
References: <1389775370-29415-1-git-send-email-francois.perrad@gadz.org>
 <874n55wo2y.fsf@dell.be.48ers.dk>
Message-ID: <CAB0FRstP_cEdRwAKjiF2qVYicWP9XaVQKbPFL9oFUaiqM5Wq7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014/1/15 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
>
>  > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> Where did you see this? On the autobuilders? If yes, please add a link.
>

in the latest autobuilder report, native Lua modules using the
`luarocks-package` infrastructure are broken :
x86_64 | lbase64-20120820-1 | NOK |
http://autobuild.buildroot.net/results/f28a624f89f4de249a1b7a718f5ae31109ba9171/
x86_64 | luabitop-1.0.2-1 | NOK |
http://autobuild.buildroot.net/results/1ead0a162a251d3e7bf8598036fa06c4befeb3d9/
x86_64 | luaexpat-1.2.0-1 | NOK |
http://autobuild.buildroot.net/results/0544cead086ba51b45dfa1df114787a8f22eaf8d/
x86_64 | luafilesystem-1.6.2-1 | NOK |
http://autobuild.buildroot.net/results/60161d13d596d41dd4059977eb947d72c172f0d5/

> It's not really about 32bits/64bits, but yes, x86-64 is one of the archs
> needing -fPIC.

Yes, x86_64

>
>  > ---
>  >  package/luarocks/luarocks.mk |    2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
>
>  > diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
>  > index 85b6866..6cfd92e 100644
>  > --- a/package/luarocks/luarocks.mk
>  > +++ b/package/luarocks/luarocks.mk
>  > @@ -31,7 +31,7 @@ define HOST_LUAROCKS_INSTALL_CMDS
>  >      echo "   LUA_LIBDIR = [[$(STAGING_DIR)/usr/lib]],"      >> $(LUAROCKS_CONFIG_FILE)
>  >      echo "   CC = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
>  >      echo "   LD = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
>  > -    echo "   CFLAGS = [[$(TARGET_CFLAGS)]],"                >> $(LUAROCKS_CONFIG_FILE)
>  > +    echo "   CFLAGS = [[$(TARGET_CFLAGS) -fPIC]],"          >> $(LUAROCKS_CONFIG_FILE)
>  >      echo "   LIBFLAG = [[-shared $(TARGET_LDFLAGS)]],"      >> $(LUAROCKS_CONFIG_FILE)
>
> What about BR2_PREFER_STATIC_LIB (for both CFLAGS and LDFLAGS lines)?

native Lua modules/extensions are always shared lib.

>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
