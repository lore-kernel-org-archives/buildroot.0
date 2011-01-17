From: Matt Johnson <mj1856@hotmail.com>
Date: Mon, 17 Jan 2011 11:45:44 -0700
Subject: [Buildroot] qtwebkit illegal instruction problem with
	external	toolchain
In-Reply-To: <AANLkTinGoE2b8t1YA7bu-ontgi++0RaGz9jNN8r_SU5t@mail.gmail.com>
References: <AANLkTinGoE2b8t1YA7bu-ontgi++0RaGz9jNN8r_SU5t@mail.gmail.com>
Message-ID: <BAY145-ds17A7EE20590429F8F04A44C2F40@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Haven't tested webkit, but this is probably the same issue I've been finding
in lots of other packages.  CodeSourcery is a multilib toolchain, and it
picks its library based on the machine architecture flag (-march).  It
assumes armv5te by default, so it is critical when you are targeting one of
the other libraries like armv4t or armv7-a (thumb) to provide -march to the
package.  This is part of the $(TARGET_CFLAGS) variable, but some packages
don't pass it properly.

-Matt

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net]
On Behalf Of Belisko Marek
Sent: Monday, January 17, 2011 5:06 AM
To: buildroot at uclibc.org
Subject: [Buildroot] qtwebkit illegal instruction problem with external
toolchain

My git head is ca2b65a6515800991dae49d1815b7bb933f4015c.
Compile qt including webkit with external toolchain (codesourcery default
from selection).

Use simple qt code to test webkit:
int main(int argc, char *argv[])
{
        QApplication a(argc, argv);
        QWebView *view = new QWebView();

 
view->load(QUrl("http://mrdoob.com/projects/chromeexperiments/ball_pool/"));

	view->showFullScreen();
        return a.exec();
}

After app. starting it failed with Illegal instruction (don't check deeply).

Do same with buildroot builded toolchain (default selection just add WCHAR
and C++ support to be able compile QT).
Application work fine without problem.

Marek

--
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
