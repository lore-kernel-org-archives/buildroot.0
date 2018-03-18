From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Mar 2018 23:15:56 +0100
Subject: [Buildroot] [PATCH 3/5] tpm2-abrmd: new package
In-Reply-To: <20180315125602.26186-3-casantos@datacom.ind.br> (Carlos Santos's
 message of "Thu, 15 Mar 2018 09:56:00 -0300")
References: <20180315125602.26186-1-casantos@datacom.ind.br>
 <20180315125602.26186-3-casantos@datacom.ind.br>
Message-ID: <87po41do83.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > This is a system daemon implementing the TPM2 access broker (TAB) &
 > Resource Manager (RM) spec from the TCG. The daemon (tpm2-abrmd) is
 > implemented using Glib and the GObject system.

 > Communication between the daemon and clients using the TPM is done with
 > a combination of DBus and Unix pipes. DBus is used for discovery,
 > session management and the 'cancel', 'setLocality', and 'getPollHandles'
 > API calls (mostly these aren't yet implemented). Pipes are used to send
 > and receive TPM commands and responses (respectively) between client and
 > server.

 > The daemon owns the com.intel.tss2.Tabrmd name on dbus. It can be
 > configured to connect to either the system or the session bus.

 > The package also provides a client library for interacting with the
 > daemon via TPM Command Transmission Interface (TCTI). It is intended for
 > use with the SAPI library (libsapi) like any other TCTI.

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 > ---
 >  package/Config.in                         |  1 +
 >  package/tpm2-abrmd/Config.in              | 25 +++++++++++
 >  package/tpm2-abrmd/S30devtpmperms         | 37 ++++++++++++++++
 >  package/tpm2-abrmd/S80tpm2-abrmd          | 74 +++++++++++++++++++++++++++++++
 >  package/tpm2-abrmd/etc.default.tpm2-abrmd |  1 +

I think this is a bit too complicated / wordy. When there are sensible
defaults we add those to the init script and just allow an
/etc/default/<pkg> to override it for special setups, so I've dropped
the etc.default.tpm2-abrmd.

The same for S30devtpmperms - I have simply added:

chown tss:tss /dev/tpm[0-9]* && chmod 600 /dev/tpm*

To check_device() in S80tpm2-abrmd and dropped S30devtpmperms.

Committed with these changes, thanks.

-- 
Bye, Peter Korsgaard
