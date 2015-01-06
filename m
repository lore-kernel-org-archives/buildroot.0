From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 6 Jan 2015 14:57:24 +0000
Subject: [Buildroot] [PATCH] automake: bump version to 1.15
In-Reply-To: <54ABE93B.3080506@imgtec.com>
References: <1420535267-45405-1-git-send-email-Vincent.Riera@imgtec.com>	<54ABC247.9030500@zacarias.com.ar>
 <20150106144530.6571a518@free-electrons.com>
 <54ABE7BA.4060005@zacarias.com.ar> <54ABE93B.3080506@imgtec.com>
Message-ID: <54ABF7D4.8000401@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Gustavo,

First issue found with automake-1.15. The package libmemcached fails at
the configure phase with the following error:

configure: error: cannot find install-sh, install.sh, or shtool in "."
"./.." "./../.."

It works fine using the automake version we have right now in Buildroot.

This snippet is included in the configure script if we use
automake-1.15, and it fails because is trying to find some files which
don't exist in the "." "./.." "./../.." directories:

-----------------------------------------------------
ac_aux_dir=
for ac_dir in "$srcdir" "$srcdir/.." "$srcdir/../.."; do
  if test -f "$ac_dir/install-sh"; then
    ac_aux_dir=$ac_dir
    ac_install_sh="$ac_aux_dir/install-sh -c"
    break
  elif test -f "$ac_dir/install.sh"; then
    ac_aux_dir=$ac_dir
    ac_install_sh="$ac_aux_dir/install.sh -c"
    break
  elif test -f "$ac_dir/shtool"; then
    ac_aux_dir=$ac_dir
    ac_install_sh="$ac_aux_dir/shtool install -c"
    break
  fi
done
if test -z "$ac_aux_dir"; then
  as_fn_error $? "cannot find install-sh, install.sh, or shtool in
\"$srcdir\" \"$srcdir/..\" \"$srcdir/../..\"" "$LINENO" 5
fi

# These three variables are undocumented and unsupported,
# and are intended to be withdrawn in a future Autoconf release.
# They can cause serious problems if a builder's source tree is in a
directory
# whose full name contains unusual characters.
ac_config_guess="$SHELL $ac_aux_dir/config.guess"  # Please don't use
this var.
ac_config_sub="$SHELL $ac_aux_dir/config.sub"  # Please don't use this var.
ac_configure="$SHELL $ac_aux_dir/configure"  # Please don't use this var.
-----------------------------------------------------

That snippet is NOT included if we don't use automake-1.15.

Regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
