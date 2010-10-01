From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 01 Oct 2010 10:41:43 -0300
Subject: [Buildroot] [SECURITY][PATCHv2] Bump quagga to 0.99.17
In-Reply-To: <20100930234735.4ffdc3ea@surf>
References: <4CA4A278.6040303@zacarias.com.ar>	<87ocbfxcsg.fsf@macbook.be.48ers.dk>	<4CA4E521.30407@zacarias.com.ar>	<87k4m3xbc1.fsf@macbook.be.48ers.dk>
	<20100930234735.4ffdc3ea@surf>
Message-ID: <4CA5E517.9060000@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/30/10 18:47, Thomas Petazzoni wrote:

> I confirm that since Gustavo converted the package to autotargets, the
> previously existing build failures with external toolchain have
> disappeared. I just tested with a recent (a few days) Git, and net-snmp
> built just fine with an external ARM CodeSourcery toolchain.
> 
> Now, I have no idea if it actually works, since I don't know how to
> test it. But that's another story :-)
> 
> Regards,
> 
> Thomas

That's easy actually :)

Stick into say /tmp/snmpd.conf:
com2sec local localhost thepassword
group MyROGroup v1 local
group MyROGroup v2c local
group MyROGroup usm local
view all included .1 80
access MyROGroup "" any noauth exact all none none
access MyRWGroup "" any noauth exact all all none
syslocation Unknown
syscontact Unknown

Run "snmpd -c /tmp/snmpd.conf".
And then run "snmpwalk -v 1 -c thepassword localhost".
You'll get loads of data if snmpd is working ok.
You can define additional ACLs (com2sec+group) to enable remote access.
