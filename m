From: James J. Dines <jdines@jdines.net>
Date: Sat, 04 Sep 2010 23:05:02 -0400
Subject: [Buildroot] About Git through SSH
In-Reply-To: <001201cb4c9c$bc402280$34c06780$@pauljones.id.au>
References: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org><201009030730.57559.minimod@morethan.org><20100903150459.059d682a@surf><201009030937.31967.minimod@morethan.org><20100903170323.3b5a8e6f@surf><000c01cb4bd0$088c14f0$19a43ed0$@pauljones.id.au>	<20100904185831.78af11ca@surf>
	<001201cb4c9c$bc402280$34c06780$@pauljones.id.au>
Message-ID: <4C8308DE.2060307@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/04/2010 09:50 PM, Paul Jones wrote:
>> -----Original Message-----
>> From: buildroot-bounces at busybox.net [mailto:buildroot-
>> bounces at busybox.net] On Behalf Of Thomas Petazzoni
>> Sent: Sunday, 5 September 2010 2:59 AM
>> To: buildroot at busybox.net
>> Subject: Re: [Buildroot] About Git through SSH
>>
>> On Sat, 4 Sep 2010 11:25:15 +1000
>> "Paul Jones" <paul@pauljones.id.au> wrote:
>>
>>> By the way, why does the source get converted to a tar.gz after the
>>> git tree is cloned? It's quite annoying because to rebuild the package
>>> you have to delete the tar.gz file as well as the build directory to
>>> force downloading of the latest source.
>>
>> I agree that this is not optimal, but this is the solution that best
> follows the
>> way Buildroot works currently. If we don't do this, where should Buildroot
> do
>> the clone ? In the $(BUILD_DIR) which gets deleted by make clean ? Or in
>> $(DL_DIR) in a directory form and then we need to do a "cp" to the
>> $(BUILD_DIR) when doing the build ?

I believe git should clone into the DL_DIR once, and only once (unless
of course you delete it from DL_DIR.)  I say this because it is source
regardless of the particular tool used to keep track of it.  Then, just
soft link to it's location in the DL_DIR from the build dir. (see also
below)
> 
> I was just thinking clone it to $(BUILD_DIR), but on further thought I can
> imagine that also would be annoying if your source was rather large.
> Perhaps we could put an option in the makefile to force a clone everytime
> the package is rebuilt?

Why would you want to do that?  You wouldn't keep downloading a tarball
once it is downloaded. Once you've cloned a repository you don't need to
do it again unless you really screw things up.  What would be nice in my
opinion is if there was an option for which commit to use with one
option being "latest" which would 'git pull' first to build the latest
version.
> 
>> In a second step, it'd be nice to be able to tell Buildroot that for this
> or that
>> package, instead of being responsible for downloading/extracting it, it
> should
>> just grab it from a given location. This is, IMHO, a change needed to make
>> Buildroot more usable during the development phase, but it needs quite a
>> bit of reflection and discussion.
> 
> That would be great.
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMgwjaAAoJECSpOhdQESq6xEUH+waOsX/nWQcTTAZZZ94PPSaq
EfLvodE0O+JCSAZ1rsXsjZmOBfgtGk6eE/peK+z9+5ZmG3QHGJ4yWq5nD3jFwPAG
Kasrz/8qTefXDYe2RbpgwX9yBOoUWnB4ZKMaXvRHyf+VCbXS3dUj0W8XTSmEuEcf
HEiSJ80MjUusO60uZ+0ojf9pZquWAWf5qi/qgdfmqT7T56BRDWabnoIpdFpUJXBl
J9mDSBNmHklYYU5P85QCMrPEHeuQ5wo9z0D08U0w998icg54rIX/gDPOUh5KmEYA
ZgPqhpmFh/K5QvDeIvN8tIN+jvIzEUSa9rzO4O8neI/CLV4+rgDVOehkPRLeuTE=
=g/uI
-----END PGP SIGNATURE-----
