From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 25 Oct 2016 22:38:52 +0200
Subject: [Buildroot] [PATCH v1] motion: fix static linking of mysql with
 enabled libz library
In-Reply-To: <20161025220356.2df4024c@free-electrons.com>
References: <1477424240-3672-1-git-send-email-ps.report@gmx.net>
 <20161025220356.2df4024c@free-electrons.com>
Message-ID: <20161025223852.661271ae@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 25 Oct 2016 22:03:56 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Tue, 25 Oct 2016 21:37:20 +0200, Peter Seiderer wrote:
> > Fixes ([1]):
> > 
> >   checking for mysql_init in -lmysqlclient... no
> >   configure: error: MySQL support can't build without MySQL libraries
> > 
> > [1] http://autobuild.buildroot.net/results/6cf/6cf38698a2a9a041ff375c01ae8898eace17cfb2
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> Can I say how much I hate when packages don't use pkg-config ? :-)
> 
> 
> > +diff --git a/configure.ac b/configure.ac
> > +index 5782fd6..aa5d9dd 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -618,8 +618,8 @@ else
> > + 		#LDFLAGS="-L$MYSQL_LIBDIR"
> > + 		saved_CFLAGS=$CFLAGS
> > + 		saved_LIBS=$LIBS
> > +-		CFLAGS="-I$MYSQL_INCDIR"
> > +-		LIBS="-L$MYSQL_LIBDIR"
> > ++		CFLAGS="-I$MYSQL_INCDIR $CFLAGS"
> > ++		LIBS="-L$MYSQL_LIBDIR $LIBS"
> > + 		AC_CHECK_LIB(mysqlclient,mysql_init,[
> > + 					TEMP_LIBS="$TEMP_LIBS -L$MYSQL_LIBDIR -lmysqlclient -lz"
> 
> Isn't it already linking with -lz here ?
> 
> Why is an additional -lz needed ?

No, the third argument of AC_CHECK_LIB is 'action-if-found', an additional library should be given as
fifth argument (see[2]:

  AC_CHECK_LIB (library, function, [action-if-found], [action-if-not-found], [other-libraries])

This -lz is only evaluated after the check (succeeds)...

Regards,
Peter

[2] https://www.gnu.org/software/autoconf/manual/autoconf-2.66/html_node/Libraries.html

> 
> Thanks,
> 
> Thomas
