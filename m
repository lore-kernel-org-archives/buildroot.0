From: Maarten ter Huurne <maarten@treewalker.org>
Date: Mon, 06 Oct 2014 00:17:43 +0200
Subject: [Buildroot] [PATCH] vsftpd: Add build option to disable utmpx
	update code
In-Reply-To: <20141005234637.715fa4fb@free-electrons.com>
References: <1410873450-19158-1-git-send-email-maarten@treewalker.org>
 <20141005234637.715fa4fb@free-electrons.com>
Message-ID: <3812649.c7Zos5kZI3@hyperion>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 05 October 2014 23:46:37 Thomas Petazzoni wrote:
> Dear Maarten ter Huurne,
> 
> On Tue, 16 Sep 2014 15:17:30 +0200, Maarten ter Huurne wrote:
> > This was modeled after a similar option for Dropbear.
> > 
> > The utmpx code is automatically disabled when compiling with musl,
> > to avoid a build error due to WTMPX_FILE being undefined.
> 
> I find this explanation unclear: when you say "is", I assume it's
> *before* this patch is applied, but my understanding is that you mean
> *once* the patch is applied, correct?

Correct. It describes the behavior that this patch introduces in 
package/vsftpd/Config.in, for which there is no "before". But it is not 
clear that it applies only to that part of the changes: if you look at the 
vsftpd package as a whole, then it could indeed be misinterpreted as 
describing the previous situation. I will rephrase it if the other parts of 
the patch are accepted.

> > Note that
> > musl has an empty utmpx implementation, so no functionality is lost
> > by not calling it.
> > 
> > Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> > ---
> > Note that previously the utmpx code was being built, so this patch
> > changes the default behavior. I think this is not a problem because
> > most systems would not have a valid utmpx file, but it might be worth
> > mentioning in the release notes.
> 
> Then instead of adding yet another new option, what about simply
> disabling the utmpx support in vsftpd.mk when the C library is musl,
> and keep it enabled otherwise?

That is possible, but systems running a libc with utmpx support might not 
actually be using it. This fragment exists in package/dropbear/Config.in:

config BR2_PACKAGE_DROPBEAR_WTMP
        bool "log dropbear access to wtmp"
        help
          Enable logging of dropbear access to wtmp. Notice that
          Buildroot does not generate wtmp by default.

Therefore I thought that having an option to disable the feature would be 
useful even if building it is possible.

> >  package/vsftpd/Config.in                        | 12 ++++++
> >  package/vsftpd/vsftpd-0001-utmpx-builddef.patch | 49
> >  +++++++++++++++++++++++++ package/vsftpd/vsftpd.mk                    
> >     |  8 ++++
> >  3 files changed, 69 insertions(+)
> >  create mode 100644 package/vsftpd/vsftpd-0001-utmpx-builddef.patch
> 
> Have you submitted vsftpd-0001-utmpx-builddef.patch upstream? It's kind
> of a feature patch, so something we _generally_ don't like to take in
> Buildroot.

Yes, I mailed it to the maintainer on 2014-09-16. I haven't had a reply yet.

Bye,
		Maarten
