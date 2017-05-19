From: Ryan Coe <bluemrp9@gmail.com>
Date: Fri, 19 May 2017 08:44:53 -0700
Subject: [Buildroot] [PATCH 1/1] mariadb: security bump to version
	10.1.23
In-Reply-To: <87bmqugre8.fsf@dell.be.48ers.dk>
References: <20170508153716.16809-1-bluemrp9@gmail.com>
 <87efvzno6c.fsf@dell.be.48ers.dk>
 <7f264a9b-c5cf-feaf-a8bf-929d112fb7f0@gmail.com>
 <87bmqugre8.fsf@dell.be.48ers.dk>
Message-ID: <049c9e3d-2262-476b-008a-12e53d0a8598@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,


On 5/15/2017 6:51 AM, Peter Korsgaard wrote:
>>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:
> Hi,
>
>   >> Thanks, I (obviously) want to apply this, but something odd is going on
>   >> with the licensing. COPYING.LESSER has been removed by this commit:
>   >>
>   >> https://github.com/MariaDB/server/commit/577915def8
>   >>
>   >> But the client library IS listed as being LGPL:
>   >>
>   >> https://mariadb.com/kb/en/mariadb/mariadb-connector-c/
>   >>
>   >> And same for the "old" one:
>   >>
>   >> https://mariadb.com/kb/en/mariadb/lgpl-mysql-client-library-32358/
>   >>
>   >> Grepping around in the 10.1.23 tarball, I don't see a lot of references
>   >> to Lesser og LGPL.
>   >>
>   >> Now, I know next to nothing about mariadb. Do you have any idea what is
>   >> going on here?
>   >>
>   > I am really not sure what is going on there.
>
> :/
>
> Could you perhaps try to contact the mariadb developers?
>
Below is the response that I received on this issue:

https://jira.mariadb.org/browse/MDEV-12297

This is the full story:

* All MySQL code, including libmysqlclient, is GPLv2
* When implementing async API for libmysqlclient, we have licensed it
   under LGPL. That's when COPYING.LESSER was added. Apparently someone
   thought that having both COPYING and COPYING.LESSER means that the
   project includes both GPL and LGPL components
* Then we got MDEV-12297, saying Github suddenly started showing MariaDB
   license as LGPL
* Github uses a library "licensee" to detect the license, and it was a
   recent bugfix in licensee to return "LGPL" when both COPYING and
   COPYING.LESSER are present.
* Indeed,https://www.gnu.org/licenses/gpl-howto.html  says that LGPL
   licensed projects should have both files. So licensee and Github were
   right.
* At that point in time we already have all async API code in
   MariaDB Connector/C library (which is LGPL as a whole), so the
   simplest solution was to remove COPYING.LESSER, basically relicensing
   async API for libmysqlclient under GPLv2.

Practically it changes nothing.
MariaDB server was and is GPLv2, we cannot change that.
libmysqlclient library was and is GPLv2, we cannot change that.
MariaDB Connector/C was and is LGPLv2.1
