From: Ajorian <arastoo.ajorian@gmail.com>
Date: Mon, 28 Nov 2016 21:43:00 -0800 (PST)
Subject: [Buildroot] problem with cups
In-Reply-To: <298f3527-2510-22f2-7dda-67e6db24cfab@mind.be>
References: <1480147676790-151149.post@n4.nabble.com>
 <1480163241688-151160.post@n4.nabble.com>
 <298f3527-2510-22f2-7dda-67e6db24cfab@mind.be>
Message-ID: <1480398180736-151362.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi, i patched the file and compile the project. but now when i try to connect
to the cupsd using my web browser (ip_address:631/admin) i get "Internal
Server Error"!

my configuration in cupsd.conf is as follows:


#
# "$Id: cupsd.conf.in 9407 2010-12-09 21:24:51Z mike $"
#
# Sample configuration file for the CUPS scheduler.  See "man cupsd.conf"
for a
# complete description of this file.
#

# Log general information in error_log - change "warn" to "debug"
# for troubleshooting...
LogLevel warn

# Deactivate CUPS' internal logrotating, as we provide a better one,
especially
# LogLevel debug2 gets usable now
MaxLogSize 0

# Only listen for connections from the local machine.
#Listen localhost:631
Port 631
Listen /var/run/cups/cups.sock

# Show shared printers on the local network.
Browsing On
BrowseOrder allow,deny
BrowseAllow all
BrowseLocalProtocols CUPS dnssd

# Default authentication type, when authentication is required...
DefaultAuthType Basic

# Web interface setting...
WebInterface Yes

# Restrict access to the server...
<Location />
  Order allow,deny
  Allow @local
</Location>

# Restrict access to the admin pages...
<Location /admin>
  Order allow,deny
 Allow @local
</Location>

# Restrict access to configuration files...
<Location /admin/conf>
  AuthType Default
  Require user @SYSTEM
  Order allow,deny
  Allow @local
</Location>

# Set the default printer/job policies...
<Policy default>
  # Job/subscription privacy...
  JobPrivateAccess default
  JobPrivateValues default
  SubscriptionPrivateAccess default
  SubscriptionPrivateValues default

  # Job-related operations must be done by the owner or an administrator...
  <Limit Create-Job Print-Job Print-URI Validate-Job>
    Order deny,allow
  </Limit>

  <Limit Send-Document Send-URI Hold-Job Release-Job Restart-Job Purge-Jobs
Set-Job-Attributes Create-Job-Subscription Renew-Subscription
Cancel-Subscription Get-Notifications Reprocess-Job Cancel-Current-Job
Suspend-Current-Job Resume-Job Cancel-My-Jobs Close-Job CUPS-Move-Job
CUPS-Get-Document>
    Require user @OWNER @SYSTEM
    Order deny,allow
  </Limit>

  # All administration operations require an administrator to
authenticate...
  <Limit CUPS-Add-Modify-Printer CUPS-Delete-Printer CUPS-Add-Modify-Class
CUPS-Delete-Class CUPS-Set-Default CUPS-Get-Devices>
    AuthType Default
    Require user @SYSTEM
    Order deny,allow
  </Limit>

  # All printer operations require a printer operator to authenticate...
  <Limit Pause-Printer Resume-Printer Enable-Printer Disable-Printer
Pause-Printer-After-Current-Job Hold-New-Jobs Release-Held-New-Jobs
Deactivate-Printer Activate-Printer Restart-Printer Shutdown-Printer
Startup-Printer Promote-Job Schedule-Job-After Cancel-Jobs CUPS-Accept-Jobs
CUPS-Reject-Jobs>
    AuthType Default
    Require user @SYSTEM
    Order deny,allow
  </Limit>

  # Only the owner or an administrator can cancel or authenticate a job...
  <Limit Cancel-Job CUPS-Authenticate-Job>
    Require user @OWNER @SYSTEM
    Order deny,allow
  </Limit>

  <Limit All>
    Order deny,allow
  </Limit>
</Policy>

# Set the authenticated printer/job policies...
<Policy authenticated>
  # Job/subscription privacy...
  JobPrivateAccess default
  JobPrivateValues default
  SubscriptionPrivateAccess default
  SubscriptionPrivateValues default

  # Job-related operations must be done by the owner or an administrator...
  <Limit Create-Job Print-Job Print-URI Validate-Job>
    AuthType Default
    Order deny,allow
  </Limit>

  <Limit Send-Document Send-URI Hold-Job Release-Job Restart-Job Purge-Jobs
Set-Job-Attributes Create-Job-Subscription Renew-Subscription
Cancel-Subscription Get-Notifications Reprocess-Job Cancel-Current-Job
Suspend-Current-Job Resume-Job Cancel-My-Jobs Close-Job CUPS-Move-Job
CUPS-Get-Document>
    AuthType Default
    Require user @OWNER @SYSTEM
    Order deny,allow
  </Limit>

  # All administration operations require an administrator to
authenticate...
  <Limit CUPS-Add-Modify-Printer CUPS-Delete-Printer CUPS-Add-Modify-Class
CUPS-Delete-Class CUPS-Set-Default>
    AuthType Default
    Require user @SYSTEM
    Order deny,allow
  </Limit>

  # All printer operations require a printer operator to authenticate...
  <Limit Pause-Printer Resume-Printer Enable-Printer Disable-Printer
Pause-Printer-After-Current-Job Hold-New-Jobs Release-Held-New-Jobs
Deactivate-Printer Activate-Printer Restart-Printer Shutdown-Printer
Startup-Printer Promote-Job Schedule-Job-After Cancel-Jobs CUPS-Accept-Jobs
CUPS-Reject-Jobs>
    AuthType Default
    Require user @SYSTEM
    Order deny,allow
  </Limit>

  # Only the owner or an administrator can cancel or authenticate a job...
  <Limit Cancel-Job CUPS-Authenticate-Job>
    AuthType Default
    Require user @OWNER @SYSTEM
    Order deny,allow
  </Limit>

  <Limit All>
    Order deny,allow
  </Limit>
</Policy>

#
# End of "$Id: cupsd.conf.in 9407 2010-12-09 21:24:51Z mike $".
#



and my error_log is also here:


E [29/Nov/2016:08:54:37 +0000] Unknown directive BrowseOrder on line 23 of
/etc/cups/cupsd.conf.
E [29/Nov/2016:08:54:37 +0000] Unknown directive BrowseAllow on line 24 of
/etc/cups/cupsd.conf.
E [29/Nov/2016:08:54:37 +0000] Unknown browse protocol "CUPS" ignored.
E [29/Nov/2016:08:54:37 +0000] HP_LaserJet_P2035: File
\"/usr/lib/cups/filter/foomatic-rip\" not available: No such file or
directory
E [29/Nov/2016:08:54:37 +0000] HP_LaserJet_P2035: File
\"/usr/lib/cups/filter/foomatic-rip\" not available: Too many levels of
symbolic links
E [29/Nov/2016:08:54:37 +0000] HP_LaserJet_Professional_P1102: File
\"/usr/lib/cups/filter/foomatic-rip\" not available: Too many levels of
symbolic links
E [29/Nov/2016:08:54:37 +0000] HP_LaserJet_Professional_P1102: File
\"/usr/lib/cups/filter/foomatic-rip\" not available: Too many levels of
symbolic links
W [29/Nov/2016:08:54:37 +0000] CreateProfile failed:
org.freedesktop.DBus.Error.ServiceUnknown:The name
org.freedesktop.ColorManager was not provided by any .service files
W [29/Nov/2016:08:54:37 +0000] CreateDevice failed:
org.freedesktop.DBus.Error.ServiceUnknown:The name
org.freedesktop.ColorManager was not provided by any .service files
W [29/Nov/2016:08:54:37 +0000] CreateProfile failed:
org.freedesktop.DBus.Error.ServiceUnknown:The name
org.freedesktop.ColorManager was not provided by any .service files
W [29/Nov/2016:08:54:37 +0000] CreateDevice failed:
org.freedesktop.DBus.Error.ServiceUnknown:The name
org.freedesktop.ColorManager was not provided by any .service files
E [29/Nov/2016:08:54:37 +0000] Unable to open listen socket for address
[v1.::]:631 - Address family not supported by protocol.


is it possible to help me? thanks alot 




-----
it seams some thing in the word is wrong!
--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/problem-with-cups-tp151149p151362.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
