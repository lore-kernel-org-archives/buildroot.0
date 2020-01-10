From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 10 Jan 2020 20:53:47 +0100
Subject: [Buildroot] dillo
In-Reply-To: <b192f7f2-e7c8-45c3-0fd5-a9c2db78a92d@cam.ac.uk>
References: <372b903d-cd05-28bd-b1ba-7ac3314ee165@cam.ac.uk>
 <20200109215025.377ae5b8@gmx.net> <20200109222935.2f3fec16@gmx.net>
 <b192f7f2-e7c8-45c3-0fd5-a9c2db78a92d@cam.ac.uk>
Message-ID: <20200110205347.6aaa4eed@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jonathan,

On Fri, 10 Jan 2020 10:15:35 +0000, Jonathan Kimmitt <jrrk2@cam.ac.uk> wrote:

> Dear Peter,
>
> Thanks for that analsys. My second patch obviously was just a workaround
> to prevent the compile error.
>
> Is there any special instruction to automate the process of testing
> these patches? I am not familiar
>
> with systems that are not GitHub based.

	$ wget https://buildroot.org/downloads/buildroot-2019.11.tar.bz2
	$ tar -xjf buildroot-2019.11.tar.bz2
	$ curl -OJL  https://patchwork.ozlabs.org/patch/1220668/mbox
	$ cd buildroot-2019.11
	$ patch -p 1 < ../v1-package-dillo-fix-openssl-support.patch

or

	$ git clone https://git.busybox.net/buildroot
	$ curl -OJL  https://patchwork.ozlabs.org/patch/1220668/mbox
	$ cd buildroot
	$ git checkout 2019.11
	$ git checkout -b test-dill-patch-001
	$ git am ../v1-package-dillo-fix-openssl-support.patch

and proceed with your dillo test config (and in case your re-use an
existing build mind the dirclean/rebuild hints [3])...

Regards,
Peter

[3] https://buildroot.org/downloads/manual/manual.html#rebuild-pkg

>
> Regards,
>
> Jonathan
>
> On 09/01/2020 21:29, Peter Seiderer wrote:
> > Hello Jonathan,
> >
> > On Thu, 9 Jan 2020 21:50:25 +0100, Peter Seiderer <ps.report@gmx.net> wrote:
> >
> >> Hello Jonathan
> >>
> >> added CC buildroot at buildroot.org
> >>
> >> On Thu, 9 Jan 2020 17:09:12 +0000, Jonathan Kimmitt <jrrk2@cam.ac.uk> wrote:
> >>
> >>> Dear Peter,
> >>>
> >>> Are you a maintainer for the dillo port to buildroot? If so I have some
> >>> patches for you
> >> Yes, somehow...
> >>
> >>> concerning SSL compatibility, relative to the 2019.11 release. No doubt
> >>> they need reworking to be upstream worthy.
> >> Thanks for the patches, some remarks:
> >>
> >> - 0003-SSL_library_init.patch
> >>
> >>> SSL_library_init is now a #define, causing this check to fail ...
> >>>
> >>> --- a/configure.ac	2020-01-09 14:57:27.823065488 +0000
> >>> +++ b/configure.ac	2020-01-09 14:59:35.735065000 +0000
> >>> @@ -276,7 +276,7 @@
> >>>
> >>>     if test "x$ssl_ok" = "xyes"; then
> >>>       old_libs="$LIBS"
> >>> -    AC_CHECK_LIB(ssl, SSL_library_init, ssl_ok=yes, ssl_ok=no, -lcrypto)
> >>> +    AC_CHECK_LIB(ssl, OPENSSL_init_ssl, ssl_ok=yes, ssl_ok=no, -lcrypto)
> >>>       LIBS="$old_libs"
> >>>     fi
> >> Which openssl provider/library did you use, openssl (BR2_PACKAGE_LIBOPENSSL=y) or
> >> libressl (BR2_PACKAGE_LIBRESSL=y)?
> >>
> >> Will test/check your patch (but needs some time, I am no daily dillo user ;-) )...
> > O.k, your patch works with the current libopenssl-1.1.1d and libressl-3.0.2 (just
> > did a quick compile time test)...
> >
> >>
> >> - 0004-certificate.patch
> >>
> >>> --- a/dpi/https.c	2015-06-30 15:06:08.000000000 +0100
> >>> +++ b/dpi/https.c	2020-01-09 15:28:25.843058400 +0000
> >>> @@ -475,9 +475,12 @@
> >>>            break;
> >>>         case X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT:
> >>>            /*Either self signed and untrusted*/
> >>> +#if 0
> >>>            /*Extract CN from certificate name information*/
> >>>            if ((cn = strstr(remote_cert->name, "/CN=")) == NULL) {
> >>> -            strcpy(buf, "(no CN given)");
> >>> +#endif
> >>> +           strcpy(buf, "(no CN given)");
> >>> +#if 0
> >>>            } else {
> >>>               char *cn_end;
> >>>
> >>> @@ -489,6 +492,7 @@
> >>>               strncpy(buf, cn, (size_t) (cn_end - cn));
> >>>               buf[cn_end - cn] = '\0';
> >>>            }
> >>> +#endif
> >>>            msg = dStrconcat("The remote certificate is self-signed and "
> >>>                             "untrusted.\nFor address: ", buf, NULL);
> >>>            d_cmd = a_Dpip_build_cmd(
> >> This one looks like upstream commit 'Support OpenSSL 1.1.0' ([1]) and
> >> according to the mercurial info should be contained in the 3.0.5
> >> release (in case I read the mercurial info right), but seems not to
> >> be contained in the dillo-3.0.5.tar.bz2 sources...
> > And with your openssl detection fix this upstream commit is needed to
> > avoid a compile failure...., just send out a proper buildroot patch
> > adding the two dillo patches ([2])....
> >
> > Regards,
> > Peter
> >
> >> Regards,
> >> Peter
> > [2] https://patchwork.ozlabs.org/patch/1220668/
> >
> >> [1] https://hg.dillo.org/dillo/rev/b171b8610400
> >>
> >>> Regards,
> >>>
> >>> Jonathan Kimmitt
> >>>
> >>>
> >>>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot
