From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 04:13:01 -0700
Subject: [Buildroot] [PATCH 0/3] oracle-mysql bugfix, security fix,
 and enhancement
Message-ID: <20180820111304.22933-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

0001-oracle-mysql-fix-hostname-path.patch
configure script picks up the hosts /usr/bin/hostname,  but buildroot
uses /bin/hostname. This breaks several helper scripts. For example the
startup wrapper ends up using a logfile of /var/mysql/.err instead of
/var/mysql/buildroot.err

0002-oracle-mysql-use-group-mysql-not-nogroup.patch
The makefile specifies a user mysql using group nogroup.  The /var/mysql
directory is world readable.  mysqld creates files with permisions 660.
If another process or user also has access to nogroup, then they have
access to all of the database data.  IMHO, this is bad.

0003-oracle-mysql-check-for-my.cnf-before-starting.patch
enhancement, don't start the daemon unless there is a configuration file

Christopher McCrory (3):
  oracle-mysql: fix hostname path
  oracle-mysql: use group mysql, not nogroup
  oracle-mysql: check for my.cnf before starting

 package/oracle-mysql/S97mysqld       | 1 +
 package/oracle-mysql/oracle-mysql.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.14.4
