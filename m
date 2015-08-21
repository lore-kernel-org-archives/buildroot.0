From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Fri, 21 Aug 2015 15:20:10 +0200
Subject: [Buildroot] [PATCH 3/7 v2] galera: new package
In-Reply-To: <559EED42.8010609@mind.be>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1436458921-4199-4-git-send-email-sylvain.raybaud@green-communications.fr>
 <CAHXCMML5sejdn7saGW8znTAGdDzAUcE-Y4TVQT0ttSJDt4whqg@mail.gmail.com>
 <559EED42.8010609@mind.be>
Message-ID: <55D7258A.5060904@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Arnout,

On 09/07/2015 23:53, Arnout Vandecappelle wrote:
> On 07/09/15 23:29, Samuel Martin wrote:

>>> diff --git
>>> a/package/galera/galera-01-fix_sconstruct_for-crosscompiling.patch
>>> b/package/galera/galera-01-fix_sconstruct_for-crosscompiling.patch
>>>
>>> 
[..]
>>> ++# Cross-compilation ++ ++if 'CROSS' in os.environ: ++
>>> cross = os.environ['CROSS'] ++        env.Append(CROSS =
>>> cross) ++        env.Replace(CC = cross + 'gcc') ++
>>> env.Replace(CXX = cross + 'g++')
> 
> This means ccache will not be used. We prefer to pass CC and CXX in
> the environment (through TARGET_CONFIGURE_OPTS). I think that would
> even work out of the box without any patch, no?

I think TARGET_CONFIGURE_OPTS was already added to scons environment,
see the lines below in galera.mk (from my patch):

+GALERA_SCONS_ENV = $(TARGET_CONFIGURE_OPTS) BR2_ARCH=$(BR2_ARCH)

[..]

+define GALERA_BUILD_CMDS
+        cd $(@D) && \
+	  $(GALERA_SCONS_ENV) \
+	  CROSS=$(TARGET_CROSS) \
+	  $(SCONS) \
+	  $(GALERA_SCONS_OPTS)
+endef

I'll make the other requested changes and test again, maybe the
problem was somewhere else.


>>> + # these will be used only with our softaware + if
>>> strict_build_flags == 1: +-    conf.env.Append(CPPFLAGS = '
>>> -Werror') ++    conf.env.Append(CPPFLAGS = ' -Werror
>>> -Wno-error=uninitialized -Wno-error=pedantic')
>> Hum... -Werror is more a development flag than an integration
>> one. It should certainly be removed.
> 
> Better yet, make sure the strict_build_flags is not set.
> 

Perfectly right.  I failed to notice that sctrict_build_flags=0 could
be passed to scons. Thanks.

Cheers,

Sylvain

> 
> Regards, Arnout
> 
> [snip]
> 
> 

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV1yWKAAoJEEkkwl4JtJ9yCxkP/25RrYpGdZFJYehEuf3T/27R
ttvzToHlWrlOzhxG4qxNZ20YPoSejVkOFIfOzDBL0SdV7SclPxJC3rnQ/mHJGTB+
Ln0kJ0h/hgfpHi6575YmaQlGU5PQ64va9rrYa6fUbLvjZ7QHCiGm/d0+2s+R5zoX
Da459zUVZq1yjk6YYu5JDaDrp5NcINi+KWpyhpowg379B6BUr0mR7Q/eyA4G2bfL
7Z6Ivv6j9qHYRlOzBYMwHgLR4S+oRe4A3esVkXtfFsREUIHTcAunyS7OTi3uN2rT
oud6DKXNtPoTykQxOccGRVxToCZYVpDq3Jd6bEyyWk1EhfcpAt7DNLhCgZlbaqe+
K5FqBdaNjQQ1C4W4XN111rW7BYHXkN+sP+lgeGU+i1cgVGehzia1b36e3qZWAdHr
P45YuK5QDKNol7q4riOQ0Xldnp8XkaRew4L2H2w0E4RvoCzCCvpQ4yJo3SbGT1Kj
N4VmYR+TZx2bz0cTCrrwWo9ElAbqs9GM/QXM+moCDWlTCXIRPYCeUqK96wQM+nKJ
JzqHnY/iXnzhof9/66TJEBNXjaWtE+0cvLghjPLzt8i6IgJ55GvREbjAAyVcCWmb
xPRjDkcwGFA+N/iDrnKCmZbkv1vhn3jeMewNQn4V96zy7EIL6Gw7szvB5/daoUhq
ERLMQdGihjplRJLHrXHa
=f2vd
-----END PGP SIGNATURE-----
