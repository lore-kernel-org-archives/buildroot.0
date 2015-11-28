From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Nov 2015 16:40:54 +0100
Subject: [Buildroot] [PATCH 4/7 v3] etc: add SysV-init startup script
 and sample config file
In-Reply-To: <20151128153611.26a6f491@free-electrons.com>
References: <cover.1448663846.git.yann.morin.1998@free.fr>
 <9243b48a5bc32c35039519eabf4b6946f36f3260.1448663846.git.yann.morin.1998@free.fr>
 <20151128153611.26a6f491@free-electrons.com>
Message-ID: <20151128154054.GB3816@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-28 15:36 +0100, Thomas Petazzoni spake thusly:
> On Fri, 27 Nov 2015 23:39:11 +0100, Yann E. MORIN wrote:
> 
> > diff --git a/etc/default/buildroot-autobuild b/etc/default/buildroot-autobuild
> > new file mode 100644
> > index 0000000..93b7365
> > --- /dev/null
> > +++ b/etc/default/buildroot-autobuild
> > @@ -0,0 +1,23 @@
> > +# The absolute path, outside the chroot, where the
> > +# buildroot-test tree is cloned, optional
> > +AUTOBUILD_DIR="/home/johndoe/buildroot-test"
> 
> What if my buildroot-test tree is just inside the chroot ?

That setting is "optional". See below for how it is used.

> > +# The absolute path, outside the chroot, where to
> > +# share downloads (not yet implemented)
> 
> "not yet implemented" -> why do we have some code about it in the
> script below ?

Damn, I forgot to remove it...

> > +AUTOBUILD_USER="buildroot"
> > +
> > +# The absolute path, in the chroot, that is the base of the
> > +# autobuild work dir. In there, you'll have:
> 
> What does it mean "you'll have" ? Does it mean that the init script
> will set up everything this way, or that it expect things to be already
> set up that way ?

Ok, I should have expanded on it. Here it is:

  - the buildroot-autobuild.conf has to be provided
  - the run/ directory is created
  - the buildroot-test/ directory is either:
    - bind-mounted if AUTOBUILD_DIR is set, or
    - must be already present otherwise

> > +autobuild_start() {
> > +    echo "Starting buildroot-autobuild"
> > +
> > +    CMD="cd '${AUTOBUILD_RUN_DIR}'"
> > +    CMD="${CMD}; '${AUTOBUILD_CMD}' -c '${AUTOBUILD_CFG}' --pid-file '${AUTOBUILD_CHROOT_PID_FILE}' &"
> > +
> > +    do_chroot "rm -rf '${AUTOBUILD_RUN_DIR}'"
> 
> Why ? Not only this is unnecessary because the autobuild-run script
> automatically removes instance-X/output.

Ah, damn. It's in prepare_build(). I missed it.

> > +autobuild_stop() {
> > +    echo "Stopping buildroot-autobuild"
> > +    if [ -f "${AUTOBUILD_PID_FILE}" ]; then
> > +        kill $(cat "${AUTOBUILD_PID_FILE}")
> > +    fi
> > +    rm -f "${AUTOBUILD_PID_FILE}"
> 
> The rm -f could possibly be within the if, no ?

Yes.

> Other than that, it generally looks good, but maybe
> the /etc/default/buildroot-autobuild file needs a few more comments to
> explain the expected directory layout and preparations to be done by
> the user in order to be able to use this script.

Will update.

> Also, maybe you should make the use of the chroot optional: both of us
> are running autobuild-run in a chroot, but not everyone is doing this.

Yes. It will anyway be needed when we implement the multi-chroot setup.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
