From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Dec 2015 15:03:54 +0100
Subject: [Buildroot] Howto use "Makeusers"
In-Reply-To: <56619CCF.6040008@gmx.de>
References: <56619CCF.6040008@gmx.de>
Message-ID: <20151204150354.03453463@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas,

On Fri, 4 Dec 2015 15:01:51 +0100, Andreas Ehmanns wrote:

> to make an openldap server available for buildroot I created an init 
> script which starts the ldap server as non-privileged user (and group).
> Since the ldap user and group is not existing on the target I searched 
> for a way to let the openldap package add the user and group to the 
> target filesystem. The buildroot documentation describes in chapter 23 
> the syntax of "makeusers". So far so good, but I have no idea to which 
> file I should add the corresponding makeusers command.
> 
> I grepped the buildroot tree for an example but unfortunately did not 
> found a package using this command.
> 
> Does anybody have an example how to do this.

Directly in your .mk file, using a variable named <pkg>_USERS. See
package/dbus/dbus.mk for an example:

define DBUS_USERS
        dbus -1 dbus -1 * /var/run/dbus - dbus DBus messagebus user
endef

This is also documented in the manual, which says:

   LIBFOO_USERS lists the users to create for this package, if it
   installs a program you want to run as a specific user (e.g. as a
   daemon, or as a cron-job). The syntax is similar in spirit to the
   makedevs one, and is described in the Chapter 23, Makeusers syntax
   documentation. This variable is optional.

Hope this helps,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
