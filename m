From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 19 Jan 2014 21:29:13 +0100
Subject: [Buildroot] [PATCH 08/10] support: mkusers: add warning when
	using mkpasswd from the host system
In-Reply-To: <1390073027-14239-9-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sat, 18 Jan 2014 20:23:45 +0100")
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
 <1390073027-14239-9-git-send-email-s.martin49@gmail.com>
Message-ID: <87bnz7n2au.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Because the mkpasswd provided by some distribution does not support all
 > options used in the mkusers script, mkpasswd has been integrated as a
 > package.

 > However, using a custom rootfs skeleton, the host-mkpasswd target is not
 > automatically built, even if some packages add users.

 > In this case, to help the Buildroot users understanding what happen when
 > the mkpasswd from the host system is used (so, might fail), mkusers now
 > print a warning message explaining how to solve this.

Why not just fix it to always use our mkpasswd? E.G. something like
adding host-mkpasswd to dependencies in fs/common.mk if PACKAGE_USERS
isn't empty?


 > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > ---
 >  support/scripts/mkusers | 17 +++++++++++++++++
 >  1 file changed, 17 insertions(+)

 > diff --git a/support/scripts/mkusers b/support/scripts/mkusers
 > index 3b287b8..dd011eb 100755
 > --- a/support/scripts/mkusers
 > +++ b/support/scripts/mkusers
 > @@ -52,6 +52,22 @@ PASSWD_METHOD="$( sed -r -e '/^BR2_TARGET_GENERIC_PASSWD_METHOD="(.*)"$/!d;'
 >                  )"
 
 >  #----------------------------------------------------------------------------
 > +check_mkpasswd() {
 > +    local mkpasswd_path="$(readlink -f $(which mkpasswd 2>/dev/null))"
 > +    local host_dir="$(readlink -f "${HOST_DIR}")"
 > +    case "${mkpasswd_path}" in
 > +        "${host_dir}"*) ;;
 > +        *)
 > +            error \
 > +                "WARNING: using mkpasswd from the host system: '%s'. %s%s%s\n" \
 > +                "${mkpasswd_path}"                                             \
 > +                "To avoid build failures because of unsupported options by "   \
 > +                "your host system's mkpasswd, make sure to use the one "       \
 > +                "Buildroot provides, by building the 'host-mkpasswd' target."
 > +            ;;
 > +    esac
 > +}
 > +#----------------------------------------------------------------------------
 >  get_uid() {
 >      local username="${1}"
 
 > @@ -264,6 +280,7 @@ add_user_to_group() {
 >  encode_password() {
 >      local passwd="${1}"
 
 > +    check_mkpasswd
 >      mkpasswd -m "${PASSWD_METHOD}" "${passwd}"
 >  }
 
 > -- 
 > 1.8.5.3

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
