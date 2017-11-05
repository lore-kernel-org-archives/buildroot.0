From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Nov 2017 22:20:38 +0100
Subject: [Buildroot] [PATCH 1/1] Fix build of lttng-libust
In-Reply-To: <20171105211039.GA10472@scaer>
References: <20171030163121.939-1-norbert.lange@andritz.com>
 <20171030204054.723cdc99@windsurf>
 <CADYdroP3-gaXzRy61r7FraPq+g6MeB5CUGN_nFLyFy3MxxfVvw@mail.gmail.com>
 <cf2f5ee6-d0e2-fcfa-f2af-5ff722d3388c@mind.be>
 <20171105163141.GL2996@scaer>
 <CAB4xu_0eaJgvj1dvixdnOSj8c1eO2cpXmo1m2sHp+FasXkuWYQ@mail.gmail.com>
 <20171105211039.GA10472@scaer>
Message-ID: <20171105212038.GC10472@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philippe, All,

On 2017-11-05 22:10 +0100, Yann E. MORIN spake thusly:
> On 2017-11-05 14:55 -0500, Philippe Proulx spake thusly:
> > On Sun, Nov 5, 2017 at 11:31 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> [--SNIP--]
> > > But I digress, and I think a better fix would indeed be to teach
> > > configure.ac and Makefile.am to disable building the examples.
> > I'll have a look at what we can do upstream for this.
> 
> Here is a very quick-n-dirty patch against your master, that should do
> the trick (but is totally untested). Feel free to use it as-is if you
> like it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> diff --git a/configure.ac b/configure.ac
> index ca1de874..adbd8f90 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -468,6 +468,19 @@ they will not be installed.
>  AM_CONDITIONAL([MAN_PAGES_OPT], [test "x$man_pages_opt" != "xno"])
>  AM_CONDITIONAL([HAVE_ASCIIDOC_XMLTO], [test "x$have_asciidoc_xmlto" = "xyes"])
>  
> +# Do we want to build example?
> +AC_ARG_ENABLE(
> +examples,
> +AS_HELP_STRING(
> +[--d				isable-examples],
> +[Do not build examples]
> +),
> +[examples_opt=$enab				leval],
> +[examples_opt=yes]
> +)
> +
> +AM_CONDITIONAL([EXAMPLES_OPT], [test	 "x$examples_opt" != "xno"])

Damned, this was badly mangled... :-(

et ft=
diff --git a/configure.ac b/configure.ac
index ca1de874..adbd8f90 100644
--- a/configure.ac
+++ b/configure.ac
@@ -468,6 +468,19 @@ they will not be installed.
 AM_CONDITIONAL([MAN_PAGES_OPT], [test "x$man_pages_opt" != "xno"])
 AM_CONDITIONAL([HAVE_ASCIIDOC_XMLTO], [test "x$have_asciidoc_xmlto" = "xyes"])
 
+# Do we want to build examples?
+AC_ARG_ENABLE(
+	examples,
+	AS_HELP_STRING(
+		[--disable-examples],
+		[Do not build examples]
+	),
+	[examples_opt=$enableval],
+	[examples_opt=yes]
+)
+
+AM_CONDITIONAL([EXAMPLES_OPT], [test "x$examples_opt" != "xno"])
+
 # Default values
 AC_DEFUN([_AC_DEFINE_AND_SUBST], [
 	AC_DEFINE_UNQUOTED([CONFIG_$1], [$2], [$1])
diff --git a/doc/Makefile.am b/doc/Makefile.am
index e110ed85..82689c5c 100644
--- a/doc/Makefile.am
+++ b/doc/Makefile.am
@@ -1,3 +1,7 @@
-SUBDIRS = . man examples
+if EXAMPLES_OPT
+EXAMPLES_SUBDIRS = examples
+endif
+
+SUBDIRS = . man $(EXAMPLES_SUBDIRS)
 
 dist_doc_DATA = java-agent.txt


>  # Default values
>  AC_DEFUN([_AC_DEFINE_AND_SUBST], [
>  	AC_DEFINE_UNQUOTED([CONFIG_$1], [$2], [$1])
> diff --git a/doc/Makefile.am b/doc/Makefile.am
> index e110ed85..82689c5c 100644
> --- a/doc/Makefile.am
> +++ b/doc/Makefile.am
> @@ -1,3 +1,7 @@
> -SUBDIRS = . man examples
> +if EXAMPLES_OPT
> +EXAMPLES_SUBDIRS = examples
> +endif
> +
> +SUBDIRS = . man $(EXAMPLES_SUBDIRS)
>  
>  dist_doc_DATA = java-agent.txt
> 
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
